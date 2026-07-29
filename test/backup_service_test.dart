import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:recallio/core/constants/app_constants.dart';
import 'package:recallio/db/app_database.dart';
import 'package:recallio/models/backup_manifest.dart';
import 'package:recallio/models/record_status.dart';
import 'package:recallio/models/work_type.dart';
import 'package:recallio/repositories/work_repository.dart';
import 'package:recallio/services/backup_service.dart';
import 'package:recallio/services/cover_service.dart';

void main() {
  late AppDatabase database;
  late WorkRepository repository;
  late BackupService service;
  late String coversTempDir;

  setUp(() {
    coversTempDir = Directory.systemTemp.createTempSync('recallio_test_covers_').path;
    database = AppDatabase.forTesting(NativeDatabase.memory());
    repository = WorkRepository(database, CoverService());
    service = BackupService(
      db: database,
      workRepository: repository,
      coverService: CoverService(),
      coversDirOverride: coversTempDir,
    );
  });

  tearDown(() async {
    await database.close();
  });

  // --- Task 1: fetchAllForExport ---

  test('fetchAllForExport returns all non-deleted works with record data',
      () async {
    await repository.saveWork(
      const WorkFormData(
        workId: null,
        type: WorkType.anime,
        title: 'Test Anime',
        originalTitle: '',
        aliasesText: '',
        summary: '',
        coverPath: 'covers/test.jpg',
        coverSourcePath: null,
        releaseDate: '',
        creatorsText: '',
        status: RecordStatus.finished,
        rating: 8.5,
        shortComment: '',
        review: 'Great show',
        spoilerReview: '',
        startDate: '2026-01-01',
        finishDate: '',
        progress: '',
        platform: '',
        tagNames: const [],
        sourceProvider: 'manual',
        sourceId: null,
        sourceUrl: null,
      ),
    );

    final entries = await repository.fetchAllForExport();

    expect(entries, hasLength(1));
    expect(entries.single['title'], 'Test Anime');
    expect(entries.single['type'], 'anime');
    expect(entries.single['coverPath'], 'covers/test.jpg');
    expect(entries.single['rating'], 8.5);
    expect(entries.single['review'], 'Great show');
    expect(entries.single['recordDate'], '2026-01-01');
    expect(entries.single['sourceProvider'], 'manual');
  });

  test('fetchAllForExport handles null recordDate gracefully', () async {
    await repository.saveWork(
      WorkFormData(
        workId: null,
        type: WorkType.game,
        title: 'No Date Game',
        originalTitle: '',
        aliasesText: '',
        summary: '',
        coverPath: null,
        coverSourcePath: null,
        releaseDate: '',
        creatorsText: '',
        status: RecordStatus.planned,
        rating: null,
        shortComment: '',
        review: '',
        spoilerReview: '',
        startDate: '',
        finishDate: '',
        progress: '',
        platform: '',
        tagNames: const [],
      ),
    );

    final entries = await repository.fetchAllForExport();

    expect(entries, hasLength(1));
    expect(entries.single['rating'], isNull);
    expect(entries.single['review'], isNull);
    // recordDate falls back to createdAt date portion (10 chars)
    expect(entries.single['recordDate'], isNotNull);
    expect(entries.single['recordDate']!.toString().length, 10);
  });

  test('fetchAllForExport excludes soft-deleted works', () async {
    final workId = await repository.saveWork(
      WorkFormData(
        workId: null,
        type: WorkType.manga,
        title: 'To Delete',
        originalTitle: '',
        aliasesText: '',
        summary: '',
        coverPath: null,
        coverSourcePath: null,
        releaseDate: '',
        creatorsText: '',
        status: RecordStatus.planned,
        rating: null,
        shortComment: '',
        review: '',
        spoilerReview: '',
        startDate: '',
        finishDate: '',
        progress: '',
        platform: '',
        tagNames: const [],
      ),
    );

    await repository.softDeleteWork(workId);

    final entries = await repository.fetchAllForExport();
    expect(entries, isEmpty);
  });

  // --- Zip Parsing ---

  Future<String> createTestZip({
    String app = 'Recallio',
    int schemaVersion = 1,
    List<Map<String, Object?>> entries = const [],
    bool includeManifest = true,
    bool includeData = true,
  }) async {
    final archive = Archive();
    const encoder = JsonEncoder.withIndent('  ');

    if (includeManifest) {
      final manifest = {
        'app': app,
        'schemaVersion': schemaVersion,
        'exportedAt': '2026-07-21T10:00:00.000',
        'sourceClient': 'flutter-local',
        'platform': 'windows',
      };
      final manifestJson = utf8.encode(encoder.convert(manifest));
      archive.addFile(
        ArchiveFile('manifest.json', manifestJson.length, manifestJson),
      );
    }

    if (includeData) {
      final data = {'entries': entries};
      final dataJson = utf8.encode(encoder.convert(data));
      archive.addFile(
        ArchiveFile('data.json', dataJson.length, dataJson),
      );
    }

    final zipBytes = ZipEncoder().encode(archive)!;
    final tempDir = Directory.systemTemp.createTempSync('recallio_test_');
    final zipPath = '${tempDir.path}/test.zip';
    await File(zipPath).writeAsBytes(zipBytes);

    return zipPath;
  }

  test('parseZipFile reads manifest and data correctly', () async {
    final zipPath = await createTestZip(
      entries: [
        {
          'id': 'entry-1',
          'title': 'Test Entry',
          'type': 'anime',
          'coverPath': null,
          'rating': null,
          'review': null,
          'recordDate': null,
          'sourceProvider': 'manual',
          'sourceId': null,
          'sourceUrl': null,
          'createdAt': '2026-07-21T10:00:00.000',
          'updatedAt': '2026-07-21T10:00:00.000',
          'deletedAt': null,
        },
      ],
    );

    try {
      final parsed = await service.parseZipFile(zipPath);

      expect(parsed.manifest.app, 'Recallio');
      expect(parsed.manifest.schemaVersion, 1);
      expect(parsed.entries, hasLength(1));
      expect(parsed.entries.single['title'], 'Test Entry');
      expect(parsed.coverFiles, isEmpty);
    } finally {
      File(zipPath).deleteSync();
    }
  });

  test('parseZipFile rejects wrong app name', () async {
    final zipPath = await createTestZip(app: 'NotRecallio');

    try {
      await expectLater(
        service.parseZipFile(zipPath),
        throwsA(
          isA<Exception>().having(
            (e) => e.toString(),
            'message',
            contains('不是 Recallio 备份'),
          ),
        ),
      );
    } finally {
      File(zipPath).deleteSync();
    }
  });

  test('parseZipFile rejects higher schema version', () async {
    final zipPath = await createTestZip(schemaVersion: 99);

    try {
      expect(AppConstants.backupSchemaVersion, 1);

      await expectLater(
        service.parseZipFile(zipPath),
        throwsA(
          isA<Exception>().having(
            (e) => e.toString(),
            'message',
            contains('格式版本'),
          ),
        ),
      );
    } finally {
      File(zipPath).deleteSync();
    }
  });

  test('parseZipFile throws when manifest is missing', () async {
    final zipPath = await createTestZip(includeManifest: false);

    try {
      await expectLater(
        service.parseZipFile(zipPath),
        throwsA(
          isA<Exception>().having(
            (e) => e.toString(),
            'message',
            contains('缺少 manifest.json'),
          ),
        ),
      );
    } finally {
      File(zipPath).deleteSync();
    }
  });

  test('parseZipFile throws when data.json is missing', () async {
    final zipPath = await createTestZip(includeData: false);

    try {
      await expectLater(
        service.parseZipFile(zipPath),
        throwsA(
          isA<Exception>().having(
            (e) => e.toString(),
            'message',
            contains('缺少 data.json'),
          ),
        ),
      );
    } finally {
      File(zipPath).deleteSync();
    }
  });

  // --- Import Modes ---

  ParsedBackup syntheticBackup(List<Map<String, Object?>> entries) {
    return ParsedBackup(
      manifest: BackupManifest.recallio(
        exportedAt: DateTime.now(),
        platform: 'test',
      ),
      entries: entries,
      coverFiles: const [],
    );
  }

  test('import merge mode skips existing work', () async {
    final workId = 'existing-work-id';

    await repository.saveWork(
      const WorkFormData(
        workId: 'existing-work-id',
        type: WorkType.anime,
        title: 'Original Title',
        originalTitle: '',
        aliasesText: '',
        summary: '',
        coverPath: null,
        coverSourcePath: null,
        releaseDate: '',
        creatorsText: '',
        status: RecordStatus.finished,
        rating: 7,
        shortComment: '',
        review: 'Original review',
        spoilerReview: '',
        startDate: '2026-01-01',
        finishDate: '',
        progress: '',
        platform: '',
        tagNames: const [],
      ),
    );

    final parsed = syntheticBackup([
      {
        'id': workId,
        'title': 'New Title',
        'type': 'anime',
        'rating': 9,
        'review': 'New review',
        'recordDate': '2026-02-02',
      },
      {
        'id': 'new-work-id',
        'title': 'New Entry',
        'type': 'game',
        'rating': null,
        'review': null,
        'recordDate': null,
      },
    ]);

    final result = await service.importFromParsed(
      parsed,
      mode: ImportMode.merge,
    );

    expect(result.inserted, 1);
    expect(result.skipped, 1);

    // Existing work should be unchanged
    final existing = await repository.fetchDetail(workId);
    expect(existing!.work.title, 'Original Title');
    expect(existing.rating, 7);
    expect(existing.review, 'Original review');
  });

  test('import overwrite mode replaces existing work', () async {
    final workId = 'existing-work-id';

    await repository.saveWork(
      const WorkFormData(
        workId: 'existing-work-id',
        type: WorkType.anime,
        title: 'Original Title',
        originalTitle: '',
        aliasesText: '',
        summary: '',
        coverPath: null,
        coverSourcePath: null,
        releaseDate: '',
        creatorsText: '',
        status: RecordStatus.finished,
        rating: 7,
        shortComment: '',
        review: 'Original review',
        spoilerReview: '',
        startDate: '2026-01-01',
        finishDate: '',
        progress: '',
        platform: '',
        tagNames: const [],
      ),
    );

    final parsed = syntheticBackup([
      {
        'id': workId,
        'title': 'New Title',
        'type': 'game',
        'rating': 9.5,
        'review': 'New review',
        'recordDate': '2026-02-02',
      },
    ]);

    final result = await service.importFromParsed(
      parsed,
      mode: ImportMode.overwrite,
    );

    expect(result.inserted, 1);
    expect(result.skipped, 0);

    final updated = await repository.fetchDetail(workId);
    expect(updated!.work.title, 'New Title');
    expect(updated.work.type, 'game');
    expect(updated.rating, 9.5);
    expect(updated.review, 'New review');
  });
}
