import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/metadata_search_result.dart';
import '../models/metadata_work_detail.dart';
import '../models/work_type.dart';
import 'http_client_factory.dart';
import 'metadata_provider.dart';

class BangumiProvider extends MetadataProvider {
  BangumiProvider({http.Client? client})
      : _client = client ?? createHttpClient();

  final http.Client _client;

  @override
  String get id => 'bangumi';

  @override
  String get displayName => 'Bangumi';

  @override
  bool supportsType(WorkType type) {
    return switch (type) {
      WorkType.anime ||
      WorkType.manga ||
      WorkType.novel ||
      WorkType.game =>
        true,
      WorkType.movie => false,
    };
  }

  @override
  Future<List<MetadataSearchResult>> search({
    required String keyword,
    required WorkType type,
  }) async {
    if (!supportsType(type)) {
      throw const MetadataException('该数据源暂不支持当前类型。');
    }

    try {
      final response = await _client
          .post(
            Uri.https('api.bgm.tv', '/v0/search/subjects'),
            headers: const {
              'accept': 'application/json',
              'content-type': 'application/json',
              'user-agent': 'Recallio/0.1.0 (local personal media log)',
            },
            body: jsonEncode({
              'keyword': keyword,
              'filter': {
                'type': [_bangumiTypeFor(type)],
              },
            }),
          )
          .timeout(const Duration(seconds: 30));

      if (response.statusCode < 200 || response.statusCode >= 300) {
        throw MetadataException('搜索失败（HTTP ${response.statusCode}）');
      }

      final decoded = jsonDecode(utf8.decode(response.bodyBytes));
      final rawItems = decoded is Map<String, dynamic> ? decoded['data'] : null;
      if (rawItems is! List) {
        throw const MetadataException('搜索失败，响应格式异常。');
      }

      return rawItems
          .whereType<Map<String, dynamic>>()
          .map((item) => _searchResultFromJson(item, type))
          .where((item) => item.title.trim().isNotEmpty)
          .toList();
    } on MetadataException {
      rethrow;
    } on TimeoutException {
      throw const MetadataException('搜索超时，请检查网络后重试。');
    } catch (e) {
      throw MetadataException('搜索失败：$e');
    }
  }

  @override
  Future<MetadataWorkDetail> getDetail(
    String sourceId, {
    WorkType? requestedType,
  }) async {
    try {
      final response = await _client.get(
        Uri.https('api.bgm.tv', '/v0/subjects/$sourceId'),
        headers: const {
          'accept': 'application/json',
          'user-agent': 'Recallio/0.1.0 (local personal media log)',
        },
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode < 200 || response.statusCode >= 300) {
        throw MetadataException('读取条目详情失败（HTTP ${response.statusCode}）');
      }

      final decoded = jsonDecode(utf8.decode(response.bodyBytes));
      if (decoded is! Map<String, dynamic>) {
        throw const MetadataException('读取条目详情失败，响应格式异常。');
      }
      return _detailFromJson(decoded, requestedType: requestedType);
    } on MetadataException {
      rethrow;
    } on TimeoutException {
      throw const MetadataException('读取条目详情超时，请检查网络后重试。');
    } catch (e) {
      throw MetadataException('读取条目详情失败：$e');
    }
  }

  MetadataSearchResult _searchResultFromJson(
    Map<String, dynamic> item,
    WorkType requestedType,
  ) {
    final sourceId = _stringValue(item['id']);
    final title = _bestTitle(item);
    final originalTitle = _stringValue(item['name']);
    final sourceUrl =
        sourceId == null ? null : 'https://bgm.tv/subject/$sourceId';

    return MetadataSearchResult(
      providerId: id,
      sourceId: sourceId ?? '',
      title: title,
      type: requestedType,
      subtitle: _subtitle(item),
      originalTitle: originalTitle == title ? null : originalTitle,
      summary: _stringValue(item['summary']),
      coverUrl: _imageUrl(item['images']),
      sourceUrl: sourceUrl,
      releaseDate: _stringValue(item['date']),
    );
  }

  MetadataWorkDetail _detailFromJson(
    Map<String, dynamic> item, {
    WorkType? requestedType,
  }) {
    final sourceId = _stringValue(item['id']) ?? '';
    final type =
        requestedType ?? _workTypeFromBangumi(_intValue(item['type']));
    final title = _bestTitle(item);
    final originalTitle = _stringValue(item['name']);

    return MetadataWorkDetail(
      providerId: id,
      sourceId: sourceId,
      title: title,
      type: type,
      originalTitle: originalTitle == title ? null : originalTitle,
      summary: _stringValue(item['summary']),
      coverUrl: _imageUrl(item['images']),
      sourceUrl: 'https://bgm.tv/subject/$sourceId',
      releaseDate: _stringValue(item['date']),
    );
  }

  String _bestTitle(Map<String, dynamic> item) {
    final nameCn = _stringValue(item['name_cn']);
    if (nameCn != null && nameCn.isNotEmpty) {
      return nameCn;
    }
    return _stringValue(item['name']) ?? '';
  }

  String? _subtitle(Map<String, dynamic> item) {
    final originalTitle = _stringValue(item['name']);
    final date = _stringValue(item['date']);
    final parts = [
      if (originalTitle != null && originalTitle.isNotEmpty) originalTitle,
      if (date != null && date.isNotEmpty) date,
    ];
    return parts.isEmpty ? null : parts.join(' · ');
  }

  String? _imageUrl(Object? images) {
    if (images is! Map<String, dynamic>) {
      return null;
    }
    for (final key in ['large', 'common', 'medium', 'grid', 'small']) {
      final value = _stringValue(images[key]);
      if (value != null && value.isNotEmpty) {
        return value.startsWith('//') ? 'https:$value' : value;
      }
    }
    return null;
  }

  int _bangumiTypeFor(WorkType type) {
    return switch (type) {
      WorkType.anime => 2,
      WorkType.manga || WorkType.novel => 1,
      WorkType.game => 4,
      WorkType.movie => throw const MetadataException('该数据源暂不支持当前类型。'),
    };
  }

  WorkType _workTypeFromBangumi(int? type) {
    return switch (type) {
      1 => WorkType.manga,
      2 => WorkType.anime,
      4 => WorkType.game,
      _ => WorkType.anime,
    };
  }

  String? _stringValue(Object? value) {
    if (value == null) {
      return null;
    }
    final text = value.toString().trim();
    return text.isEmpty ? null : text;
  }

  int? _intValue(Object? value) {
    if (value is int) {
      return value;
    }
    return int.tryParse(value?.toString() ?? '');
  }
}
