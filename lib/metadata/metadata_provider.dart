import '../models/metadata_search_result.dart';
import '../models/metadata_work_detail.dart';
import '../models/work_type.dart';

abstract class MetadataProvider {
  const MetadataProvider();

  String get id;
  String get displayName;

  bool supportsType(WorkType type);

  Future<List<MetadataSearchResult>> search({
    required String keyword,
    required WorkType type,
  });

  Future<MetadataWorkDetail> getDetail(
    String sourceId, {
    WorkType? requestedType,
  });
}

class MetadataException implements Exception {
  const MetadataException(this.message);

  final String message;

  @override
  String toString() => message;
}
