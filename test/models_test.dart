import 'package:flutter_test/flutter_test.dart';
import 'package:recallio/core/utils/rating_validator.dart';
import 'package:recallio/models/backup_data.dart';
import 'package:recallio/models/backup_manifest.dart';
import 'package:recallio/models/record_status.dart';
import 'package:recallio/models/work_type.dart';

void main() {
  test('work type labels are localized', () {
    expect(WorkType.anime.label, '动画');
    expect(WorkType.manga.label, '漫画');
    expect(WorkType.novel.label, '小说');
    expect(WorkType.game.label, '游戏');
    expect(WorkType.movie.label, '电影');
  });

  test('movie work type can round trip by name', () {
    expect(WorkType.fromName('movie'), WorkType.movie);
  });

  test('record status labels depend on work type', () {
    expect(RecordStatus.planned.labelFor(WorkType.anime), '想看');
    expect(RecordStatus.planned.labelFor(WorkType.novel), '想读');
    expect(RecordStatus.finished.labelFor(WorkType.game), '通关');
  });

  test('backup manifest can round trip through json', () {
    final exportedAt = DateTime.parse('2026-06-19T20:00:00+08:00');
    final manifest = BackupManifest.recallio(
      exportedAt: exportedAt,
      platform: 'windows',
    );

    final parsed = BackupManifest.fromJson(manifest.toJson());

    expect(parsed.app, 'Recallio');
    expect(parsed.schemaVersion, 1);
    expect(parsed.exportedAt.toIso8601String(), exportedAt.toIso8601String());
    expect(parsed.sourceClient, 'flutter-local');
    expect(parsed.platform, 'windows');
  });

  test('backup data uses entries top-level key', () {
    const data = BackupData(
      entries: [
        {'id': 'entry-1', 'title': 'Example'},
      ],
    );

    expect(data.toJson().keys, orderedEquals(['entries']));
    expect(BackupData.fromJson(data.toJson()).entries.single['id'], 'entry-1');
  });

  test('rating allows empty and 0.5 steps between 0 and 10', () {
    expect(RatingValidator.isValid(null), isTrue);
    expect(RatingValidator.isValid(0), isTrue);
    expect(RatingValidator.isValid(8.5), isTrue);
    expect(RatingValidator.isValid(10), isTrue);
    expect(RatingValidator.isValid(-0.5), isFalse);
    expect(RatingValidator.isValid(10.5), isFalse);
    expect(RatingValidator.isValid(8.25), isFalse);
  });
}
