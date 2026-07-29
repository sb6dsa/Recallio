import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/metadata_search_result.dart';
import '../models/metadata_work_detail.dart';
import '../models/work_type.dart';
import 'http_client_factory.dart';
import 'metadata_provider.dart';

class TMDbProvider extends MetadataProvider {
  TMDbProvider({
    required Future<String?> Function() readToken,
    http.Client? client,
  })  : _readToken = readToken,
        _client = client ?? createHttpClient();

  static const _imageBaseUrl = 'https://image.tmdb.org/t/p/w500';

  final Future<String?> Function() _readToken;
  final http.Client _client;

  @override
  String get id => 'tmdb';

  @override
  String get displayName => 'TMDb';

  @override
  bool supportsType(WorkType type) => type == WorkType.movie;

  @override
  Future<List<MetadataSearchResult>> search({
    required String keyword,
    required WorkType type,
  }) async {
    if (!supportsType(type)) {
      throw const MetadataException('该数据源暂不支持当前类型。');
    }

    final credential = await _readCredential();
    try {
      final response = await _client
          .get(
            _authorizedUri(
              path: '/3/search/movie',
              credential: credential,
              queryParameters: {
                'query': keyword,
                'language': 'zh-CN',
                'include_adult': 'false',
                'page': '1',
              },
            ),
            headers: _headers(credential),
          )
          .timeout(const Duration(seconds: 30));

      if (response.statusCode < 200 || response.statusCode >= 300) {
        throw MetadataException('电影搜索失败（HTTP ${response.statusCode}）');
      }

      final decoded = jsonDecode(utf8.decode(response.bodyBytes));
      final rawItems =
          decoded is Map<String, dynamic> ? decoded['results'] : null;
      if (rawItems is! List) {
        throw const MetadataException('电影搜索失败，响应格式异常。');
      }

      return rawItems
          .whereType<Map<String, dynamic>>()
          .map(_searchResultFromJson)
          .where((item) => item.title.trim().isNotEmpty)
          .toList();
    } on MetadataException {
      rethrow;
    } on TimeoutException {
      throw const MetadataException('电影搜索超时，请检查网络后重试。');
    } catch (e) {
      throw MetadataException('电影搜索失败：$e');
    }
  }

  @override
  Future<MetadataWorkDetail> getDetail(
    String sourceId, {
    WorkType? requestedType,
  }) async {
    final credential = await _readCredential();
    try {
      final response = await _client
          .get(
            _authorizedUri(
              path: '/3/movie/$sourceId',
              credential: credential,
              queryParameters: const {'language': 'zh-CN'},
            ),
            headers: _headers(credential),
          )
          .timeout(const Duration(seconds: 30));

      if (response.statusCode < 200 || response.statusCode >= 300) {
        throw MetadataException('读取电影详情失败（HTTP ${response.statusCode}）');
      }

      final decoded = jsonDecode(utf8.decode(response.bodyBytes));
      if (decoded is! Map<String, dynamic>) {
        throw const MetadataException('读取电影详情失败，响应格式异常。');
      }

      return _detailFromJson(decoded);
    } on MetadataException {
      rethrow;
    } on TimeoutException {
      throw const MetadataException('读取电影详情超时，请检查网络后重试。');
    } catch (e) {
      throw MetadataException('读取电影详情失败：$e');
    }
  }

  Future<_TmdbCredential> _readCredential() async {
    final rawToken = await _readToken();
    final token = rawToken?.trim();
    if (token == null || token.isEmpty) {
      throw const MetadataException('TMDb Token 未设置，请先到设置页填写。');
    }
    return _TmdbCredential(token);
  }

  Uri _authorizedUri({
    required String path,
    required _TmdbCredential credential,
    required Map<String, String> queryParameters,
  }) {
    final parameters = Map<String, String>.from(queryParameters);
    if (!credential.isBearerToken) {
      parameters['api_key'] = credential.value;
    }
    return Uri.https('api.themoviedb.org', path, parameters);
  }

  Map<String, String> _headers(_TmdbCredential credential) {
    final headers = <String, String>{
      'accept': 'application/json',
      'user-agent': 'Recallio/0.1.0 (local personal media log)',
    };
    if (credential.isBearerToken) {
      headers['authorization'] = 'Bearer ${credential.value}';
    }
    return headers;
  }

  MetadataSearchResult _searchResultFromJson(Map<String, dynamic> item) {
    final sourceId = _stringValue(item['id']) ?? '';
    final title = _titleFromJson(item);
    final originalTitle = _stringValue(item['original_title']);
    return MetadataSearchResult(
      providerId: id,
      sourceId: sourceId,
      title: title,
      type: WorkType.movie,
      originalTitle: originalTitle == title ? null : originalTitle,
      summary: _stringValue(item['overview']),
      coverUrl: _posterUrl(_stringValue(item['poster_path'])),
      sourceUrl: 'https://www.themoviedb.org/movie/$sourceId',
      releaseDate: _stringValue(item['release_date']),
    );
  }

  MetadataWorkDetail _detailFromJson(Map<String, dynamic> item) {
    final sourceId = _stringValue(item['id']) ?? '';
    final title = _titleFromJson(item);
    final originalTitle = _stringValue(item['original_title']);
    return MetadataWorkDetail(
      providerId: id,
      sourceId: sourceId,
      title: title,
      type: WorkType.movie,
      originalTitle: originalTitle == title ? null : originalTitle,
      summary: _stringValue(item['overview']),
      coverUrl: _posterUrl(_stringValue(item['poster_path'])),
      sourceUrl: 'https://www.themoviedb.org/movie/$sourceId',
      releaseDate: _stringValue(item['release_date']),
    );
  }

  String _titleFromJson(Map<String, dynamic> item) {
    return _stringValue(item['title']) ?? _stringValue(item['name']) ?? '';
  }

  String? _posterUrl(String? posterPath) {
    if (posterPath == null || posterPath.isEmpty) {
      return null;
    }
    final normalizedPath =
        posterPath.startsWith('/') ? posterPath : '/$posterPath';
    return '$_imageBaseUrl$normalizedPath';
  }

  String? _stringValue(Object? value) {
    if (value == null) {
      return null;
    }
    final text = value.toString().trim();
    return text.isEmpty ? null : text;
  }
}

class _TmdbCredential {
  const _TmdbCredential(this.value);

  final String value;

  bool get isBearerToken => value.startsWith('eyJ') || value.contains('.');
}
