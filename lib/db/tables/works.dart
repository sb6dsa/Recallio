import 'package:drift/drift.dart';

class Works extends Table {
  TextColumn get id => text()();
  TextColumn get type => text()();
  TextColumn get title => text()();
  TextColumn get originalTitle => text().nullable()();
  TextColumn get aliases => text().nullable()();
  TextColumn get summary => text().nullable()();
  TextColumn get coverPath => text().nullable()();
  TextColumn get coverSourceUrl => text().nullable()();
  TextColumn get sourceProvider => text().nullable()();
  TextColumn get sourceId => text().nullable()();
  TextColumn get sourceUrl => text().nullable()();
  TextColumn get releaseDate => text().nullable()();
  TextColumn get creators => text().nullable()();
  TextColumn get createdAt => text()();
  TextColumn get updatedAt => text()();
  TextColumn get deletedAt => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
