import 'work_type.dart';

enum RecordStatus {
  planned,
  doing,
  finished,
  paused,
  dropped;

  String labelFor(WorkType type) {
    return switch (type) {
      WorkType.novel => switch (this) {
          RecordStatus.planned => '想读',
          RecordStatus.doing => '在读',
          RecordStatus.finished => '读完',
          RecordStatus.paused => '搁置',
          RecordStatus.dropped => '弃坑',
        },
      WorkType.game => switch (this) {
          RecordStatus.planned => '想玩',
          RecordStatus.doing => '在玩',
          RecordStatus.finished => '通关',
          RecordStatus.paused => '搁置',
          RecordStatus.dropped => '弃坑',
        },
      _ => switch (this) {
          RecordStatus.planned => '想看',
          RecordStatus.doing => '在看',
          RecordStatus.finished => '看完',
          RecordStatus.paused => '搁置',
          RecordStatus.dropped => '弃坑',
        },
    };
  }

  static RecordStatus fromName(String value) {
    return RecordStatus.values.firstWhere(
      (status) => status.name == value,
      orElse: () => RecordStatus.planned,
    );
  }
}
