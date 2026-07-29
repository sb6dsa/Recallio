import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../core/constants/app_constants.dart';
import 'tables/attachments.dart';
import 'tables/external_cache.dart';
import 'tables/record_tags.dart';
import 'tables/records.dart';
import 'tables/tags.dart';
import 'tables/works.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Works,
    RecordEntries,
    Tags,
    RecordTags,
    Attachments,
    ExternalCaches,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : this._(_openConnection());

  AppDatabase.forTesting(QueryExecutor executor) : this._(executor);

  AppDatabase._(super.executor);

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final documentsDir = await getApplicationDocumentsDirectory();
    final dataDir = Directory(
      p.join(documentsDir.path, AppConstants.dataRootName, 'data'),
    );

    if (!dataDir.existsSync()) {
      dataDir.createSync(recursive: true);
    }

    final databaseFile = File(
      p.join(dataDir.path, AppConstants.databaseFileName),
    );

    return NativeDatabase.createInBackground(databaseFile);
  });
}
