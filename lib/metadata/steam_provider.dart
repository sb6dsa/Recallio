import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/metadata_search_result.dart';
import '../models/metadata_work_detail.dart';
import '../models/work_type.dart';
import 'http_client_factory.dart';
import 'metadata_provider.dart';

class SteamProvider extends MetadataProvider {
  SteamProvider({http.Client? client})
      : _client = client ?? createHttpClient();

  final http.Client _client;

  @override
  String get id => 'steam';

  @override
  String get displayName => 'Steam';

  @override
  bool supportsType(WorkType type) => type == WorkType.game;

  @override
  Future<List<MetadataSearchResult>> search({
    required String keyword,
    required WorkType type,
  }) async {
    if (!supportsType(type)) {
      throw const MetadataException('该数据源暂不支持当前类型。');
    }

    try {
      final response = await _client.get(
        Uri.https('store.steampowered.com', '/api/storesearch/', {
          'term': keyword,
          'cc': 'cn',
          'l': 'schinese',
        }),
        headers: const {
          'accept': 'application/json',
          'user-agent': 'Recallio/0.1.0 (local personal media log)',
        },
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode < 200 || response.statusCode >= 300) {
        throw MetadataException('搜索失败（HTTP ${response.statusCode}）');
      }

      final decoded = jsonDecode(utf8.decode(response.bodyBytes));
      final rawItems =
          decoded is Map<String, dynamic> ? decoded['items'] : null;
      if (rawItems is! List) {
        throw const MetadataException('搜索失败，响应格式异常。');
      }

      return rawItems
          .whereType<Map<String, dynamic>>()
          .map(_searchResultFromJson)
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
        Uri.https('store.steampowered.com', '/api/appdetails', {
          'appids': sourceId,
          'cc': 'cn',
          'l': 'schinese',
          'filters': 'basic',
        }),
        headers: const {
          'accept': 'application/json',
          'user-agent': 'Recallio/0.1.0 (local personal media log)',
        },
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode < 200 || response.statusCode >= 300) {
        throw MetadataException('读取详情失败（HTTP ${response.statusCode}）');
      }

      final decoded = jsonDecode(utf8.decode(response.bodyBytes));
      if (decoded is! Map<String, dynamic>) {
        throw const MetadataException('读取条目详情失败，请稍后重试。');
      }

      final app = decoded[sourceId];
      if (app is! Map<String, dynamic> || app['success'] != true) {
        throw const MetadataException('读取条目详情失败，请稍后重试。');
      }
      final data = app['data'];
      if (data is! Map<String, dynamic>) {
        throw const MetadataException('读取条目详情失败，请稍后重试。');
      }

      final title = _stringValue(data['name']) ?? '';
      return MetadataWorkDetail(
        providerId: id,
        sourceId: sourceId,
        title: title,
        type: WorkType.game,
        summary: _stringValue(data['short_description']),
        coverUrl: _stringValue(data['header_image']),
        sourceUrl: 'https://store.steampowered.com/app/$sourceId',
        releaseDate: _releaseDate(data['release_date']),
      );
    } on MetadataException {
      rethrow;
    } on TimeoutException {
      throw const MetadataException('读取条目详情超时，请检查网络后重试。');
    } catch (e) {
      throw MetadataException('读取条目详情失败：$e');
    }
  }

  MetadataSearchResult _searchResultFromJson(Map<String, dynamic> item) {
    final sourceId = _stringValue(item['id']) ?? '';
    return MetadataSearchResult(
      providerId: id,
      sourceId: sourceId,
      title: _stringValue(item['name']) ?? '',
      type: WorkType.game,
      coverUrl: _coverUrl(_stringValue(item['id'])),
      sourceUrl: 'https://store.steampowered.com/app/$sourceId',
    );
  }

  String? _releaseDate(Object? value) {
    if (value is Map<String, dynamic>) {
      return _stringValue(value['date']);
    }
    return null;
  }

  String? _coverUrl(String? appId) {
    if (appId == null || appId.isEmpty) {
      return null;
    }
    return 'https://cdn.cloudflare.steamstatic.com/steam/apps/$appId/header.jpg';
  }

  String? _stringValue(Object? value) {
    if (value == null) {
      return null;
    }
    final text = value.toString().trim();
    return text.isEmpty ? null : text;
  }
}
