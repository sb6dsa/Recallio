import 'package:drift/drift.dart';

@TableIndex(name: 'external_cache_provider_query', columns: {#provider, #query})
class ExternalCaches extends Table {
  @override
  String get tableName => 'external_cache';

  TextColumn get id => text()();
  TextColumn get provider => text()();
  TextColumn get query => text()();
  TextColumn get type => text().nullable()();
  TextColumn get responseJson => text()();
  TextColumn get cachedAt => text()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
