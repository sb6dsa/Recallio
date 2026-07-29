import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:recallio/metadata/bangumi_provider.dart';
import 'package:recallio/metadata/manual_provider.dart';
import 'package:recallio/metadata/metadata_provider.dart';
import 'package:recallio/metadata/steam_provider.dart';
import 'package:recallio/metadata/tmdb_provider.dart';
import 'package:recallio/models/metadata_search_result.dart';
import 'package:recallio/models/metadata_work_detail.dart';
import 'package:recallio/models/work_type.dart';
import 'package:recallio/repositories/metadata_repository.dart';

void main() {
  test('manual provider supports all current work types', () {
    const provider = ManualProvider();

    for (final type in WorkType.values) {
      expect(provider.supportsType(type), isTrue);
    }
  });

  test('manual provider creates a local metadata result from keyword',
      () async {
    const provider = ManualProvider();

    final results = await provider.search(
      keyword: '蜂蜜与四叶草',
      type: WorkType.anime,
    );

    expect(results, hasLength(1));
    expect(results.single.providerId, 'manual');
    expect(results.single.title, '蜂蜜与四叶草');
    expect(results.single.type, WorkType.anime);

    final detail = await provider.getDetail(results.single.sourceId);
    expect(detail.providerId, 'manual');
    expect(detail.title, '蜂蜜与四叶草');
    expect(detail.type, WorkType.anime);
  });

  test('metadata repository filters providers by type', () {
    final repository = MetadataRepository(
      providers: [
        const ManualProvider(),
        _GameOnlyProvider(),
      ],
    );

    expect(
      repository
          .providersForType(WorkType.anime)
          .map((provider) => provider.id),
      ['manual'],
    );
    expect(
      repository.providersForType(WorkType.game).map((provider) => provider.id),
      ['manual', 'game-only'],
    );
  });

  test('metadata repository reports unsupported provider and type in Chinese',
      () async {
    final repository = MetadataRepository(
      providers: [
        _GameOnlyProvider(),
      ],
    );

    expect(
      () => repository.providerById('missing'),
      throwsA(
        isA<MetadataException>().having(
          (error) => error.message,
          'message',
          '未找到指定的数据源。',
        ),
      ),
    );

    await expectLater(
      repository.search(
        providerId: 'game-only',
        keyword: '蜂蜜与四叶草',
        type: WorkType.anime,
      ),
      throwsA(
        isA<MetadataException>().having(
          (error) => error.message,
          'message',
          '该数据源暂不支持当前类型。',
        ),
      ),
    );
  });

  test('tmdb provider only supports movie', () {
    final provider = TMDbProvider(readToken: () async => 'test-api-key');

    expect(provider.supportsType(WorkType.movie), isTrue);
    expect(provider.supportsType(WorkType.anime), isFalse);
    expect(provider.supportsType(WorkType.manga), isFalse);
    expect(provider.supportsType(WorkType.novel), isFalse);
    expect(provider.supportsType(WorkType.game), isFalse);
  });

  test('tmdb provider maps movie search results', () async {
    final provider = TMDbProvider(
      readToken: () async => 'test-api-key',
      client: MockClient((request) async {
        expect(request.url.path, '/3/search/movie');
        expect(request.url.queryParameters['query'], '千与千寻');
        expect(request.url.queryParameters['language'], 'zh-CN');
        expect(request.url.queryParameters['include_adult'], 'false');
        expect(request.url.queryParameters['api_key'], 'test-api-key');

        return http.Response(
          '''
          {
            "results": [
              {
                "id": 129,
                "title": "千与千寻",
                "original_title": "千と千尋の神隠し",
                "overview": "少女误入神灵世界。",
                "poster_path": "/39wmItIWsg5sZMyRUHLkWBcuVCM.jpg",
                "release_date": "2001-07-20"
              }
            ]
          }
          ''',
          200,
          headers: const {'content-type': 'application/json; charset=utf-8'},
        );
      }),
    );

    final results = await provider.search(
      keyword: '千与千寻',
      type: WorkType.movie,
    );

    expect(results, hasLength(1));
    expect(results.single.providerId, 'tmdb');
    expect(results.single.sourceId, '129');
    expect(results.single.title, '千与千寻');
    expect(results.single.type, WorkType.movie);
    expect(results.single.originalTitle, '千と千尋の神隠し');
    expect(results.single.summary, '少女误入神灵世界。');
    expect(
      results.single.coverUrl,
      'https://image.tmdb.org/t/p/w500/39wmItIWsg5sZMyRUHLkWBcuVCM.jpg',
    );
    expect(results.single.sourceUrl, 'https://www.themoviedb.org/movie/129');
    expect(results.single.releaseDate, '2001-07-20');
  });

  test('tmdb provider reports missing token in Chinese', () async {
    final provider = TMDbProvider(readToken: () async => null);

    await expectLater(
      provider.search(keyword: '千与千寻', type: WorkType.movie),
      throwsA(
        isA<MetadataException>().having(
          (error) => error.message,
          'message',
          'TMDb Token 未设置，请先到设置页填写。',
        ),
      ),
    );
  });

  // --- BangumiProvider Tests ---

  test('bangumi provider supports anime, manga, novel, game but not movie', () {
    final provider = BangumiProvider();

    expect(provider.supportsType(WorkType.anime), isTrue);
    expect(provider.supportsType(WorkType.manga), isTrue);
    expect(provider.supportsType(WorkType.novel), isTrue);
    expect(provider.supportsType(WorkType.game), isTrue);
    expect(provider.supportsType(WorkType.movie), isFalse);
  });

  test('bangumi provider maps anime search results correctly', () async {
    final provider = BangumiProvider(
      client: MockClient((request) async {
        expect(request.url.path, '/v0/search/subjects');
        expect(request.method, 'POST');
        return http.Response(
          '{"data": [{"id": 1, "name_cn": "测试动画", "name": "Test Anime", '
          '"type": 2, "summary": "简介内容", "date": "2024-01-01", '
          '"images": {"large": "https://example.com/cover.jpg"}}]}',
          200,
          headers: {'content-type': 'application/json; charset=utf-8'},
        );
      }),
    );

    final results = await provider.search(keyword: '测试', type: WorkType.anime);

    expect(results, hasLength(1));
    expect(results.single.providerId, 'bangumi');
    expect(results.single.sourceId, '1');
    expect(results.single.title, '测试动画');
    expect(results.single.type, WorkType.anime);
    expect(results.single.summary, '简介内容');
    expect(results.single.coverUrl, 'https://example.com/cover.jpg');
    expect(results.single.sourceUrl, 'https://bgm.tv/subject/1');
    expect(results.single.releaseDate, '2024-01-01');
  });

  test('bangumi provider getDetail returns novel type with requestedType',
      () async {
    final provider = BangumiProvider(
      client: MockClient((request) async {
        expect(request.url.path, '/v0/subjects/1');
        return http.Response(
          '{"id": 1, "name_cn": "测试小说", "name": "Test Novel", "type": 1, '
          '"summary": "小说简介", '
          '"images": {"large": "https://example.com/novel.jpg"}}',
          200,
          headers: {'content-type': 'application/json; charset=utf-8'},
        );
      }),
    );

    final detail = await provider.getDetail(
      '1',
      requestedType: WorkType.novel,
    );

    expect(detail.providerId, 'bangumi');
    expect(detail.sourceId, '1');
    expect(detail.title, '测试小说');
    expect(detail.type, WorkType.novel);
  });

  test('bangumi provider throws MetadataException on non-200 response',
      () async {
    final provider = BangumiProvider(
      client: MockClient((request) async {
        return http.Response('', 500);
      }),
    );

    await expectLater(
      provider.search(keyword: 'test', type: WorkType.anime),
      throwsA(
        isA<MetadataException>().having(
          (error) => error.message,
          'message',
          '搜索失败（HTTP 500）',
        ),
      ),
    );
  });

  test('bangumi provider throws MetadataException on malformed response',
      () async {
    final provider = BangumiProvider(
      client: MockClient((request) async {
        return http.Response(
          '{"no_data_here": []}',
          200,
          headers: {'content-type': 'application/json; charset=utf-8'},
        );
      }),
    );

    await expectLater(
      provider.search(keyword: 'test', type: WorkType.anime),
      throwsA(
        isA<MetadataException>().having(
          (error) => error.message,
          'message',
          '搜索失败，响应格式异常。',
        ),
      ),
    );
  });

  // --- SteamProvider Tests ---

  test('steam provider only supports game', () {
    final provider = SteamProvider();

    expect(provider.supportsType(WorkType.game), isTrue);
    expect(provider.supportsType(WorkType.anime), isFalse);
    expect(provider.supportsType(WorkType.manga), isFalse);
    expect(provider.supportsType(WorkType.novel), isFalse);
    expect(provider.supportsType(WorkType.movie), isFalse);
  });

  test('steam provider maps game search results correctly', () async {
    final provider = SteamProvider(
      client: MockClient((request) async {
        expect(request.url.path, '/api/storesearch/');
        return http.Response(
          '{"items": [{"id": 123, "name": "Hollow Knight", '
          '"tiny_image": "https://old.cdn/thumb.jpg"}]}',
          200,
          headers: {'content-type': 'application/json; charset=utf-8'},
        );
      }),
    );

    final results = await provider.search(
      keyword: 'Hollow Knight',
      type: WorkType.game,
    );

    expect(results, hasLength(1));
    expect(results.single.providerId, 'steam');
    expect(results.single.sourceId, '123');
    expect(results.single.title, 'Hollow Knight');
    expect(results.single.type, WorkType.game);
    expect(
      results.single.coverUrl,
      'https://cdn.cloudflare.steamstatic.com/steam/apps/123/header.jpg',
    );
    expect(results.single.sourceUrl, 'https://store.steampowered.com/app/123');
  });

  test('steam provider getDetail returns correct fields', () async {
    final provider = SteamProvider(
      client: MockClient((request) async {
        expect(request.url.path, '/api/appdetails');
        return http.Response(
          '{"123": {"success": true, "data": {'
          '"name": "Hollow Knight", '
          '"short_description": "An action adventure game.", '
          '"header_image": "https://cdn/header.jpg", '
          '"release_date": {"date": "2017-02-24"}}}}',
          200,
          headers: {'content-type': 'application/json; charset=utf-8'},
        );
      }),
    );

    final detail = await provider.getDetail('123');

    expect(detail.providerId, 'steam');
    expect(detail.sourceId, '123');
    expect(detail.title, 'Hollow Knight');
    expect(detail.summary, 'An action adventure game.');
    expect(detail.coverUrl, 'https://cdn/header.jpg');
    expect(detail.releaseDate, '2017-02-24');
    expect(detail.sourceUrl, 'https://store.steampowered.com/app/123');
  });

  test('steam provider throws MetadataException on non-200 search', () async {
    final provider = SteamProvider(
      client: MockClient((request) async {
        return http.Response('', 500);
      }),
    );

    await expectLater(
      provider.search(keyword: 'test', type: WorkType.game),
      throwsA(
        isA<MetadataException>().having(
          (error) => error.message,
          'message',
          '搜索失败（HTTP 500）',
        ),
      ),
    );
  });

  test('steam provider getDetail throws when success is false', () async {
    final provider = SteamProvider(
      client: MockClient((request) async {
        return http.Response(
          '{"999": {"success": false}}',
          200,
          headers: {'content-type': 'application/json; charset=utf-8'},
        );
      }),
    );

    await expectLater(
      provider.getDetail('999'),
      throwsA(
        isA<MetadataException>().having(
          (error) => error.message,
          'message',
          '读取条目详情失败，请稍后重试。',
        ),
      ),
    );
  });
}

class _GameOnlyProvider extends MetadataProvider {
  @override
  String get id => 'game-only';

  @override
  String get displayName => '游戏数据源';

  @override
  bool supportsType(WorkType type) => type == WorkType.game;

  @override
  Future<List<MetadataSearchResult>> search({
    required String keyword,
    required WorkType type,
  }) async {
    return const [];
  }

  @override
  Future<MetadataWorkDetail> getDetail(
    String sourceId, {
    WorkType? requestedType,
  }) {
    throw UnimplementedError();
  }
}
