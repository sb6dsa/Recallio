import 'package:drift/drift.dart';

import 'records.dart';
import 'tags.dart';

class RecordTags extends Table {
  TextColumn get recordId => text().references(RecordEntries, #id)();
  TextColumn get tagId => text().references(Tags, #id)();

  @override
  Set<Column<Object>> get primaryKey => {recordId, tagId};
}
