import 'work_type.dart';

class MetadataWorkDetail {
  const MetadataWorkDetail({
    required this.providerId,
    required this.sourceId,
    required this.title,
    required this.type,
    this.originalTitle,
    this.summary,
    this.coverUrl,
    this.sourceUrl,
    this.releaseDate,
  });

  final String providerId;
  final String sourceId;
  final String title;
  final WorkType type;
  final String? originalTitle;
  final String? summary;
  final String? coverUrl;
  final String? sourceUrl;
  final String? releaseDate;
}
