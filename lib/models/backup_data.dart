class BackupData {
  const BackupData({
    this.entries = const [],
    this.works = const [],
    this.records = const [],
    this.tags = const [],
    this.recordTags = const [],
    this.attachments = const [],
  });

  final List<Map<String, Object?>> entries;
  final List<Map<String, Object?>> works;
  final List<Map<String, Object?>> records;
  final List<Map<String, Object?>> tags;
  final List<Map<String, Object?>> recordTags;
  final List<Map<String, Object?>> attachments;

  factory BackupData.fromJson(Map<String, Object?> json) {
    List<Map<String, Object?>> readList(String key) {
      final value = json[key];
      if (value is! List) {
        return const [];
      }
      return value.whereType<Map>().map((item) {
        return item.cast<String, Object?>();
      }).toList();
    }

    return BackupData(
      entries: readList('entries'),
      works: readList('works'),
      records: readList('records'),
      tags: readList('tags'),
      recordTags: readList('recordTags'),
      attachments: readList('attachments'),
    );
  }

  Map<String, Object?> toJson() {
    return {
      'entries': entries,
    };
  }
}
