import 'package:drift/drift.dart';

import 'works.dart';

@TableIndex(name: 'records_work_id', columns: {#workId})
class RecordEntries extends Table {
  @override
  String get tableName => 'records';

  TextColumn get id => text()();
  TextColumn get workId => text().references(Works, #id)();
  TextColumn get status => text()();
  RealColumn get rating => real().nullable()();
  TextColumn get shortComment => text().nullable()();
  TextColumn get review => text().nullable()();
  TextColumn get spoilerReview => text().nullable()();
  TextColumn get startDate => text().nullable()();
  TextColumn get finishDate => text().nullable()();
  TextColumn get progress => text().nullable()();
  TextColumn get platform => text().nullable()();
  IntColumn get favoriteLevel => integer().nullable()();
  TextColumn get createdAt => text()();
  TextColumn get updatedAt => text()();
  TextColumn get deletedAt => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
