import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recallio/db/app_database.dart';
import 'package:recallio/models/record_status.dart';
import 'package:recallio/models/work_type.dart';
import 'package:recallio/repositories/work_repository.dart';
import 'package:recallio/services/cover_service.dart';

void main() {
  late AppDatabase database;
  late WorkRepository repository;

  setUp(() {
    database = AppDatabase.forTesting(NativeDatabase.memory());
    repository = WorkRepository(database, CoverService());
  });

  tearDown(() async {
    await database.close();
  });

  test('creates, lists, updates tags, and soft deletes a work record',
      () async {
    final workId = await repository.saveWork(
      const WorkFormData(
        workId: null,
        type: WorkType.anime,
        title: '蜂蜜与四叶草',
        originalTitle: 'ハチミツとクローバー',
        aliasesText: 'Honey and Clover',
        summary: '青春群像剧。',
        coverPath: null,
        coverSourcePath: null,
        releaseDate: '2005',
        creatorsText: 'J.C.STAFF',
        status: RecordStatus.finished,
        rating: 9,
        shortComment: '温柔但不轻飘。',
        review: '重看依然喜欢。',
        spoilerReview: '',
        startDate: '2026-06-01',
        finishDate: '2026-06-10',
        progress: '全 24 话',
        platform: '本地',
        tagNames: ['青春', '治愈', '青春'],
      ),
    );

    final items = await repository.watchLibrary().first;

    expect(items, hasLength(1));
    expect(items.single.work.id, workId);
    expect(items.single.work.title, '蜂蜜与四叶草');
    expect(items.single.status, RecordStatus.finished);
    expect(items.single.rating, 9);
    expect(items.single.tags.map((tag) => tag.name), containsAll(['青春', '治愈']));

    await repository.saveWork(
      WorkFormData(
        workId: workId,
        type: WorkType.anime,
        title: '蜂蜜与四叶草',
        originalTitle: 'ハチミツとクローバー',
        aliasesText: 'Honey and Clover',
        summary: '青春群像剧。',
        coverPath: null,
        coverSourcePath: null,
        releaseDate: '2005',
        creatorsText: 'J.C.STAFF',
        status: RecordStatus.finished,
        rating: 9.5,
        shortComment: '温柔但不轻飘。',
        review: '重看依然喜欢。',
        spoilerReview: '',
        startDate: '2026-06-01',
        finishDate: '2026-06-10',
        progress: '全 24 话',
        platform: '本地',
        tagNames: const ['青春', '经典'],
      ),
    );

    final updated = await repository.fetchDetail(workId);
    expect(updated?.rating, 9.5);
    expect(updated?.tags.map((tag) => tag.name), containsAll(['经典', '青春']));

    await repository.softDeleteWork(workId);
    expect(await repository.watchLibrary().first, isEmpty);
  });
}
