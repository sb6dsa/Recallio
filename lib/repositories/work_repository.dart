import 'dart:async';
import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../db/app_database.dart';
import '../db/database_provider.dart';
import '../models/record_status.dart';
import '../models/work_type.dart';
import '../services/cover_service.dart';

final workRepositoryProvider = Provider<WorkRepository>((ref) {
  return WorkRepository(
    ref.watch(appDatabaseProvider),
    ref.watch(coverServiceProvider),
  );
});

final workLibraryProvider = StreamProvider.autoDispose<List<WorkRecordItem>>(
  (ref) => ref.watch(workRepositoryProvider).watchLibrary(),
);

final workDetailProvider =
    StreamProvider.autoDispose.family<WorkRecordItem?, String>(
  (ref, workId) => ref.watch(workRepositoryProvider).watchDetail(workId),
);

class WorkRecordItem {
  const WorkRecordItem({
    required this.work,
    required this.record,
    required this.tags,
  });

  final Work work;
  final RecordEntry? record;
  final List<Tag> tags;

  WorkType get type => WorkType.fromName(work.type);

  RecordStatus get status => record == null
      ? RecordStatus.planned
      : RecordStatus.fromName(record!.status);

  String get displayStatus => status.labelFor(type);

  double? get rating => record?.rating;

  String? get shortComment => record?.shortComment;

  String? get review {
    final longReview = record?.review?.trim();
    if (longReview != null && longReview.isNotEmpty) {
      return longReview;
    }
    final shortReview = record?.shortComment?.trim();
    return shortReview == null || shortReview.isEmpty ? null : shortReview;
  }

  String? get recordDate {
    final explicitDate = record?.startDate?.trim();
    if (explicitDate != null && explicitDate.isNotEmpty) {
      return explicitDate;
    }
    final createdAt = record?.createdAt;
    if (createdAt == null || createdAt.length < 10) {
      return null;
    }
    return createdAt.substring(0, 10);
  }

  String? get lastModifiedDate {
    final updatedAt = work.updatedAt;
    if (updatedAt.length < 10) return null;
    return updatedAt.substring(0, 10);
  }
}

class WorkFormData {
  const WorkFormData({
    required this.workId,
    required this.type,
    required this.title,
    required this.originalTitle,
    required this.aliasesText,
    required this.summary,
    required this.coverPath,
    required this.coverSourcePath,
    required this.releaseDate,
    required this.creatorsText,
    required this.status,
    required this.rating,
    required this.shortComment,
    required this.review,
    required this.spoilerReview,
    required this.startDate,
    required this.finishDate,
    required this.progress,
    required this.platform,
    required this.tagNames,
    this.sourceProvider = 'manual',
    this.sourceId,
    this.sourceUrl,
  });

  final String? workId;
  final WorkType type;
  final String title;
  final String originalTitle;
  final String aliasesText;
  final String summary;
  final String? coverPath;
  final String? coverSourcePath;
  final String releaseDate;
  final String creatorsText;
  final RecordStatus status;
  final double? rating;
  final String shortComment;
  final String review;
  final String spoilerReview;
  final String startDate;
  final String finishDate;
  final String progress;
  final String platform;
  final List<String> tagNames;
  final String sourceProvider;
  final String? sourceId;
  final String? sourceUrl;
}

class WorkRepository {
  WorkRepository(this._db, this._coverService);

  final AppDatabase _db;
  final CoverService _coverService;
  final _uuid = const Uuid();

  Stream<List<WorkRecordItem>> watchLibrary() {
    final query = _workRecordQuery()
      ..where(_db.works.deletedAt.isNull())
      ..orderBy([
        OrderingTerm(
          expression: _db.works.updatedAt,
          mode: OrderingMode.desc,
        ),
      ]);

    return query.watch().asyncMap(_rowsToItems);
  }

  Stream<WorkRecordItem?> watchDetail(String workId) {
    final query = _workRecordQuery()
      ..where(_db.works.id.equals(workId) & _db.works.deletedAt.isNull());

    return query.watch().asyncMap((rows) async {
      final items = await _rowsToItems(rows);
      return items.firstOrNull;
    });
  }

  Future<WorkRecordItem?> fetchDetail(String workId) async {
    final query = _workRecordQuery()
      ..where(_db.works.id.equals(workId) & _db.works.deletedAt.isNull());
    final items = await _rowsToItems(await query.get());
    return items.firstOrNull;
  }

  Future<String> saveWork(WorkFormData data) async {
    final existingWork = data.workId == null
        ? null
        : await (_db.select(_db.works)
              ..where((tbl) => tbl.id.equals(data.workId!)))
            .getSingleOrNull();

    final workId = existingWork?.id ?? data.workId ?? _uuid.v4();
    final now = DateTime.now().toIso8601String();
    final record = await _activeRecordForWork(workId);
    final recordId = record?.id ?? _uuid.v4();
    final coverPath = data.coverSourcePath == null
        ? data.coverPath
        : await _coverService.copyCoverForWork(
            sourcePath: data.coverSourcePath!,
            workId: workId,
          );

    await _db.transaction(() async {
      if (existingWork == null) {
        await _db.into(_db.works).insert(
              WorksCompanion.insert(
                id: workId,
                type: data.type.name,
                title: data.title.trim(),
                originalTitle: Value(_emptyToNull(data.originalTitle)),
                aliases: Value(_listJsonFromText(data.aliasesText)),
                summary: Value(_emptyToNull(data.summary)),
                coverPath: Value(coverPath),
                sourceProvider: Value(_emptyToNull(data.sourceProvider)),
                sourceId: Value(_emptyToNull(data.sourceId ?? '')),
                sourceUrl: Value(_emptyToNull(data.sourceUrl ?? '')),
                releaseDate: Value(_emptyToNull(data.releaseDate)),
                creators: Value(_listJsonFromText(data.creatorsText)),
                createdAt: now,
                updatedAt: now,
              ),
            );
      } else {
        await (_db.update(_db.works)..where((tbl) => tbl.id.equals(workId)))
            .write(
          WorksCompanion(
            type: Value(data.type.name),
            title: Value(data.title.trim()),
            originalTitle: Value(_emptyToNull(data.originalTitle)),
            aliases: Value(_listJsonFromText(data.aliasesText)),
            summary: Value(_emptyToNull(data.summary)),
            coverPath: Value(coverPath),
            releaseDate: Value(_emptyToNull(data.releaseDate)),
            creators: Value(_listJsonFromText(data.creatorsText)),
            updatedAt: Value(now),
            deletedAt: const Value(null),
          ),
        );
      }

      if (record == null) {
        await _db.into(_db.recordEntries).insert(
              RecordEntriesCompanion.insert(
                id: recordId,
                workId: workId,
                status: data.status.name,
                rating: Value(data.rating),
                shortComment: Value(_emptyToNull(data.shortComment)),
                review: Value(_emptyToNull(data.review)),
                spoilerReview: Value(_emptyToNull(data.spoilerReview)),
                startDate: Value(_emptyToNull(data.startDate)),
                finishDate: Value(_emptyToNull(data.finishDate)),
                progress: Value(_emptyToNull(data.progress)),
                platform: Value(_emptyToNull(data.platform)),
                createdAt: now,
                updatedAt: now,
              ),
            );
      } else {
        await (_db.update(_db.recordEntries)
              ..where((tbl) => tbl.id.equals(record.id)))
            .write(
          RecordEntriesCompanion(
            status: Value(data.status.name),
            rating: Value(data.rating),
            shortComment: Value(_emptyToNull(data.shortComment)),
            review: Value(_emptyToNull(data.review)),
            spoilerReview: Value(_emptyToNull(data.spoilerReview)),
            startDate: Value(_emptyToNull(data.startDate)),
            finishDate: Value(_emptyToNull(data.finishDate)),
            progress: Value(_emptyToNull(data.progress)),
            platform: Value(_emptyToNull(data.platform)),
            updatedAt: Value(now),
            deletedAt: const Value(null),
          ),
        );
      }

      await _syncTags(recordId, data.tagNames, now);
    });

    return workId;
  }

  Future<void> softDeleteWork(String workId) async {
    final now = DateTime.now().toIso8601String();
    await _db.transaction(() async {
      await (_db.update(_db.works)..where((tbl) => tbl.id.equals(workId)))
          .write(
        WorksCompanion(
          updatedAt: Value(now),
          deletedAt: Value(now),
        ),
      );

      await (_db.update(_db.recordEntries)
            ..where((tbl) => tbl.workId.equals(workId)))
          .write(
        RecordEntriesCompanion(
          updatedAt: Value(now),
          deletedAt: Value(now),
        ),
      );
    });
  }

  Future<List<Map<String, Object?>>> fetchAllForExport() async {
    final query = _db.select(_db.works).join([
      leftOuterJoin(
        _db.recordEntries,
        _db.recordEntries.workId.equalsExp(_db.works.id) &
            _db.recordEntries.deletedAt.isNull(),
      ),
    ])
      ..where(_db.works.deletedAt.isNull())
      ..orderBy([OrderingTerm.asc(_db.works.createdAt)]);

    final rows = await query.get();
    final entries = <Map<String, Object?>>[];

    for (final row in rows) {
      final work = row.readTable(_db.works);
      final record = row.readTableOrNull(_db.recordEntries);

      String? recordDate;
      if (record?.startDate != null &&
          record!.startDate!.trim().isNotEmpty) {
        recordDate = record.startDate!.trim();
      } else if (record?.createdAt != null &&
          record!.createdAt.length >= 10) {
        recordDate = record.createdAt.substring(0, 10);
      }

      entries.add({
        'id': work.id,
        'title': work.title,
        'type': work.type,
        'coverPath': work.coverPath,
        'rating': record?.rating,
        'review': _nullIfEmpty(record?.review),
        'recordDate': recordDate,
        'sourceProvider': work.sourceProvider,
        'sourceId': work.sourceId,
        'sourceUrl': work.sourceUrl,
        'createdAt': work.createdAt,
        'updatedAt': work.updatedAt,
        'deletedAt': work.deletedAt,
      });
    }

    return entries;
  }

  JoinedSelectStatement<HasResultSet, dynamic> _workRecordQuery() {
    return _db.select(_db.works).join([
      leftOuterJoin(
        _db.recordEntries,
        _db.recordEntries.workId.equalsExp(_db.works.id) &
            _db.recordEntries.deletedAt.isNull(),
      ),
    ]);
  }

  Future<List<WorkRecordItem>> _rowsToItems(
    List<TypedResult> rows,
  ) async {
    final items = <WorkRecordItem>[];
    for (final row in rows) {
      final work = row.readTable(_db.works);
      final record = row.readTableOrNull(_db.recordEntries);
      items.add(
        WorkRecordItem(
          work: work,
          record: record,
          tags: record == null ? const [] : await _tagsForRecord(record.id),
        ),
      );
    }
    return items;
  }

  Future<RecordEntry?> _activeRecordForWork(String workId) {
    return (_db.select(_db.recordEntries)
          ..where(
            (tbl) => tbl.workId.equals(workId) & tbl.deletedAt.isNull(),
          ))
        .getSingleOrNull();
  }

  Future<List<Tag>> _tagsForRecord(String recordId) async {
    final query = _db.select(_db.tags).join([
      innerJoin(
        _db.recordTags,
        _db.recordTags.tagId.equalsExp(_db.tags.id),
      ),
    ])
      ..where(
        _db.recordTags.recordId.equals(recordId) & _db.tags.deletedAt.isNull(),
      )
      ..orderBy([OrderingTerm.asc(_db.tags.name)]);

    final rows = await query.get();
    return rows.map((row) => row.readTable(_db.tags)).toList();
  }

  Future<void> _syncTags(
    String recordId,
    List<String> rawNames,
    String now,
  ) async {
    final names = _normalizeTagNames(rawNames);

    await (_db.delete(_db.recordTags)
          ..where((tbl) => tbl.recordId.equals(recordId)))
        .go();

    for (final name in names) {
      final tagId = await _upsertTag(name, now);
      await _db.into(_db.recordTags).insert(
            RecordTagsCompanion.insert(recordId: recordId, tagId: tagId),
            mode: InsertMode.insertOrIgnore,
          );
    }
  }

  Future<String> _upsertTag(String name, String now) async {
    final existing = await (_db.select(_db.tags)
          ..where((tbl) => tbl.name.equals(name)))
        .getSingleOrNull();

    if (existing == null) {
      final tagId = _uuid.v4();
      await _db.into(_db.tags).insert(
            TagsCompanion.insert(
              id: tagId,
              name: name,
              createdAt: now,
              updatedAt: now,
            ),
          );
      return tagId;
    }

    if (existing.deletedAt != null) {
      await (_db.update(_db.tags)..where((tbl) => tbl.id.equals(existing.id)))
          .write(
        TagsCompanion(
          updatedAt: Value(now),
          deletedAt: const Value(null),
        ),
      );
    }

    return existing.id;
  }
}

String? _emptyToNull(String value) {
  final trimmed = value.trim();
  return trimmed.isEmpty ? null : trimmed;
}

String? _nullIfEmpty(String? value) {
  if (value == null) return null;
  final trimmed = value.trim();
  return trimmed.isEmpty ? null : trimmed;
}

String? _listJsonFromText(String value) {
  final items = _normalizeTagNames(value.split(RegExp('[,，\\n]')));
  if (items.isEmpty) {
    return null;
  }
  return jsonEncode(items);
}

List<String> _normalizeTagNames(Iterable<String> rawNames) {
  final result = <String>[];
  final seen = <String>{};
  for (final rawName in rawNames) {
    final name = rawName.trim();
    final key = name.toLowerCase();
    if (name.isNotEmpty && seen.add(key)) {
      result.add(name);
    }
  }
  return result;
}
