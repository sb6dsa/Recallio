import 'metadata_provider.dart';
import '../models/metadata_search_result.dart';
import '../models/metadata_work_detail.dart';
import '../models/work_type.dart';

class ManualProvider extends MetadataProvider {
  const ManualProvider();

  @override
  String get id => 'manual';

  @override
  String get displayName => '手动创建';

  @override
  bool supportsType(WorkType type) => true;

  @override
  Future<List<MetadataSearchResult>> search({
    required String keyword,
    required WorkType type,
  }) async {
    final title = keyword.trim();
    if (title.isEmpty) {
      return const [];
    }

    return [
      MetadataSearchResult(
        providerId: id,
        sourceId: _encodeSourceId(type: type, title: title),
        title: title,
        type: type,
      ),
    ];
  }

  @override
  Future<MetadataWorkDetail> getDetail(
    String sourceId, {
    WorkType? requestedType,
  }) async {
    final decoded = _decodeSourceId(sourceId);
    return MetadataWorkDetail(
      providerId: id,
      sourceId: sourceId,
      title: decoded.title,
      type: decoded.type,
    );
  }

  static String _encodeSourceId({
    required WorkType type,
    required String title,
  }) {
    return '${type.name}:${Uri.encodeComponent(title)}';
  }

  static _ManualSource _decodeSourceId(String sourceId) {
    final separatorIndex = sourceId.indexOf(':');
    if (separatorIndex <= 0 || separatorIndex == sourceId.length - 1) {
      throw const MetadataException('手动条目信息无效。');
    }

    final typeName = sourceId.substring(0, separatorIndex);
    final encodedTitle = sourceId.substring(separatorIndex + 1);
    final type = WorkType.values.cast<WorkType?>().firstWhere(
          (value) => value?.name == typeName,
          orElse: () => null,
        );
    if (type == null) {
      throw const MetadataException('手动条目类型无效。');
    }

    final title = Uri.decodeComponent(encodedTitle).trim();
    if (title.isEmpty) {
      throw const MetadataException('请输入作品标题。');
    }

    return _ManualSource(type: type, title: title);
  }
}

class _ManualSource {
  const _ManualSource({
    required this.type,
    required this.title,
  });

  final WorkType type;
  final String title;
}
