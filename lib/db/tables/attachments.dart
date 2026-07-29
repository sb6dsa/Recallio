import 'package:drift/drift.dart';

import 'records.dart';
import 'works.dart';

class Attachments extends Table {
  TextColumn get id => text()();
  TextColumn get workId => text().nullable().references(Works, #id)();
  TextColumn get recordId => text().nullable().references(RecordEntries, #id)();
  TextColumn get type => text()();
  TextColumn get localPath => text()();
  TextColumn get sourceUrl => text().nullable()();
  TextColumn get createdAt => text()();
  TextColumn get deletedAt => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
