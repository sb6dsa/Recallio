import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import '../core/constants/app_constants.dart';
import '../db/app_database.dart';
import '../db/database_provider.dart';
import '../models/backup_data.dart';
import '../models/backup_manifest.dart';
import '../repositories/work_repository.dart';
import 'cover_service.dart';

// --- Public Types ---

enum ImportMode { overwrite, merge }

class ImportResult {
  const ImportResult({
    required this.inserted,
    required this.skipped,
    required this.coverFilesExtracted,
  });

  final int inserted;
  final int skipped;
  final int coverFilesExtracted;
}

class ParsedBackup {
  const ParsedBackup({
    required this.manifest,
    required this.entries,
    required this.coverFiles,
  });

  final BackupManifest manifest;
  final List<Map<String, Object?>> entries;
  final List<CoverFileEntry> coverFiles;
}

class CoverFileEntry {
  const CoverFileEntry({required this.zipPath, required this.bytes});

  final String zipPath;
  final List<int> bytes;
}

// --- Riverpod Provider ---

final backupServiceProvider = Provider<BackupService>((ref) {
  return BackupService(
    db: ref.watch(appDatabaseProvider),
    workRepository: ref.watch(workRepositoryProvider),
    coverService: ref.watch(coverServiceProvider),
  );
});

// --- BackupService ---

class BackupService {
  BackupService({
    required AppDatabase db,
    required WorkRepository workRepository,
    required CoverService coverService,
    String? coversDirOverride,
  })  : _db = db,
        _workRepository = workRepository,
        _coverService = coverService,
        _coversDirOverride = coversDirOverride;

  final AppDatabase _db;
  final WorkRepository _workRepository;
  final CoverService _coverService;
  final String? _coversDirOverride;
  final _uuid = const Uuid();

  // --- Export ---

  Future<String> exportToZip({String? savePath}) async {
    final zipBytes = await _buildZipArchive();
    if (zipBytes.isEmpty) {
      throw Exception('无法生成备份包：压缩数据为空。');
    }

    final dateStr = _dateStamp();
    final fileName = 'recallio_backup_$dateStr.zip';

    if (savePath != null) {
      final outputFile = File(savePath);
      final parent = outputFile.parent;
      if (!parent.existsSync()) {
        parent.createSync(recursive: true);
      }
      await outputFile.writeAsBytes(zipBytes);
      return savePath;
    }

    // Try Downloads folder first (user-accessible), fall back to app storage
    String backupDirPath;
    try {
      final downloadsDir = await getDownloadsDirectory();
      if (downloadsDir != null) {
        backupDirPath = p.join(downloadsDir.path, 'Recallio');
      } else {
        throw Exception('downloads unavailable');
      }
    } catch (_) {
      try {
        final extDir = await getExternalStorageDirectory();
        if (extDir != null) {
          backupDirPath = p.join(extDir.path, 'Recallio');
        } else {
          throw Exception('external storage unavailable');
        }
      } catch (_) {
        final documentsDir = await getApplicationDocumentsDirectory();
        backupDirPath = p.join(
          documentsDir.path,
          AppConstants.dataRootName,
          'backups',
        );
      }
    }

    final backupDir = Directory(backupDirPath);
    if (!backupDir.existsSync()) {
      backupDir.createSync(recursive: true);
    }

    final outputFile = File(p.join(backupDir.path, fileName));
    await outputFile.writeAsBytes(zipBytes);

    return outputFile.path;
  }

  Future<List<int>> _buildZipArchive() async {
    final entries = await _workRepository.fetchAllForExport();

    final data = BackupData(entries: entries);
    const encoder = JsonEncoder.withIndent('  ');
    final dataJson = utf8.encode(encoder.convert(data.toJson()));

    final manifest = BackupManifest.recallio(
      exportedAt: DateTime.now(),
      platform: Platform.operatingSystem,
    );
    final manifestJson = utf8.encode(encoder.convert(manifest.toJson()));

    final archive = Archive();
    archive.addFile(
      ArchiveFile('manifest.json', manifestJson.length, manifestJson),
    );
    archive.addFile(
      ArchiveFile('data.json', dataJson.length, dataJson),
    );

    for (final entry in entries) {
      final coverPath = entry['coverPath'] as String?;
      if (coverPath == null || coverPath.trim().isEmpty) continue;

      final coverFile = await _coverService.resolveCoverFile(coverPath);
      if (coverFile == null) continue;

      final bytes = await coverFile.readAsBytes();
      final fileName = p.basename(coverPath);
      archive.addFile(
        ArchiveFile('covers/$fileName', bytes.length, bytes),
      );
    }

    final zipBytes = ZipEncoder().encode(archive);
    return zipBytes ?? <int>[];
  }

  // --- Parse ---

  Future<ParsedBackup> parseZipFile(String zipPath) async {
    final file = File(zipPath);
    if (!file.existsSync()) {
      throw Exception('备份文件不存在：$zipPath');
    }

    final bytes = await file.readAsBytes();
    final archive = ZipDecoder().decodeBytes(bytes);

    final manifestFile = archive.findFile('manifest.json');
    if (manifestFile == null) {
      throw Exception('备份包格式错误：缺少 manifest.json。');
    }
    final manifestJson = utf8.decode(manifestFile.content as List<int>);
    final manifestMap = jsonDecode(manifestJson) as Map<String, Object?>;
    final manifest = BackupManifest.fromJson(manifestMap);

    if (manifest.app != AppConstants.appName) {
      throw Exception(
        '备份包不是 Recallio 备份（应用名：${manifest.app}），无法导入。',
      );
    }
    if (manifest.schemaVersion > AppConstants.backupSchemaVersion) {
      throw Exception(
        '备份包格式版本（${manifest.schemaVersion}）高于当前支持的版本'
        '（${AppConstants.backupSchemaVersion}），请升级应用后重试。',
      );
    }

    final dataFile = archive.findFile('data.json');
    if (dataFile == null) {
      throw Exception('备份包格式错误：缺少 data.json。');
    }
    final dataJson = utf8.decode(dataFile.content as List<int>);
    final data = BackupData.fromJson(
      jsonDecode(dataJson) as Map<String, Object?>,
    );

    final coverFiles = <CoverFileEntry>[];
    for (final f in archive.files) {
      if (!f.isFile || f.name.isEmpty) continue;
      if (!f.name.startsWith('covers/')) continue;

      coverFiles.add(CoverFileEntry(
        zipPath: f.name,
        bytes: f.content is List<int>
            ? f.content as List<int>
            : <int>[],
      ));
    }

    return ParsedBackup(
      manifest: manifest,
      entries: data.entries,
      coverFiles: coverFiles,
    );
  }

  // --- Import ---

  Future<ImportResult> importFromParsed(
    ParsedBackup parsed, {
    required ImportMode mode,
  }) async {
    int inserted = 0;
    int skipped = 0;
    int coversExtracted = 0;

    await _db.transaction(() async {
      for (final entry in parsed.entries) {
        final workId = entry['id'] as String? ?? '';

        final existing = await (_db.select(_db.works)
              ..where((tbl) => tbl.id.equals(workId)))
            .getSingleOrNull();

        if (existing != null && mode == ImportMode.merge) {
          skipped++;
          continue;
        }

        if (existing != null) {
          await (_db.delete(_db.recordEntries)
                ..where((tbl) => tbl.workId.equals(workId)))
              .go();
          await (_db.delete(_db.works)
                ..where((tbl) => tbl.id.equals(workId)))
              .go();
        }

        await _db.into(_db.works).insert(
              WorksCompanion.insert(
                id: workId,
                type: entry['type'] as String? ?? 'anime',
                title: entry['title'] as String? ?? '',
                coverPath: Value(entry['coverPath'] as String?),
                sourceProvider: Value(entry['sourceProvider'] as String?),
                sourceId: Value(entry['sourceId'] as String?),
                sourceUrl: Value(entry['sourceUrl'] as String?),
                createdAt:
                    entry['createdAt'] as String? ?? DateTime.now().toIso8601String(),
                updatedAt:
                    entry['updatedAt'] as String? ?? DateTime.now().toIso8601String(),
                deletedAt: Value(entry['deletedAt'] as String?),
              ),
              mode: InsertMode.insertOrReplace,
            );

        final hasRecord = entry['rating'] != null ||
            (entry['review'] as String?)?.isNotEmpty == true ||
            (entry['recordDate'] as String?)?.isNotEmpty == true;

        final recordId = _uuid.v4();
        final now = DateTime.now().toIso8601String();

        await _db.into(_db.recordEntries).insert(
              RecordEntriesCompanion.insert(
                id: recordId,
                workId: workId,
                status: hasRecord ? 'finished' : 'planned',
                rating: Value((entry['rating'] as num?)?.toDouble()),
                review: Value(entry['review'] as String?),
                startDate: Value(entry['recordDate'] as String?),
                createdAt: now,
                updatedAt: now,
                deletedAt: Value(entry['deletedAt'] as String?),
              ),
              mode: InsertMode.insertOrReplace,
            );

        inserted++;
      }

      final coversDir = await _coversDir();
      for (final coverEntry in parsed.coverFiles) {
        if (coverEntry.bytes.isEmpty) continue;

        final fileName = p.basename(coverEntry.zipPath);
        final targetPath = p.join(coversDir.path, fileName);
        await File(targetPath).writeAsBytes(coverEntry.bytes);
        coversExtracted++;
      }
    });

    return ImportResult(
      inserted: inserted,
      skipped: skipped,
      coverFilesExtracted: coversExtracted,
    );
  }

  Future<Directory> _coversDir() async {
    if (_coversDirOverride != null) {
      final dir = Directory(_coversDirOverride);
      if (!dir.existsSync()) {
        dir.createSync(recursive: true);
      }
      return dir;
    }

    final documentsDir = await getApplicationDocumentsDirectory();
    final coversDir = Directory(
      p.join(documentsDir.path, AppConstants.dataRootName, 'covers'),
    );
    if (!coversDir.existsSync()) {
      coversDir.createSync(recursive: true);
    }
    return coversDir;
  }

  String _dateStamp() {
    final now = DateTime.now();
    return '${now.year}-${_pad(now.month)}-${_pad(now.day)}';
  }

  String _pad(int n) => n.toString().padLeft(2, '0');
}
