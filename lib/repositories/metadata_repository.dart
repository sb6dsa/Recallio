import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../metadata/bangumi_provider.dart';
import '../metadata/metadata_provider.dart';
import '../metadata/steam_provider.dart';
import '../metadata/tmdb_provider.dart';
import '../models/metadata_search_result.dart';
import '../models/metadata_work_detail.dart';
import '../models/work_type.dart';
import '../services/settings_service.dart';

final metadataRepositoryProvider = Provider<MetadataRepository>((ref) {
  return MetadataRepository(
    providers: [
      BangumiProvider(),
      SteamProvider(),
      TMDbProvider(
        readToken: ref.watch(settingsServiceProvider).readTmdbToken,
      ),
    ],
  );
});

class MetadataRepository {
  const MetadataRepository({
    required List<MetadataProvider> providers,
  }) : _providers = providers;

  final List<MetadataProvider> _providers;

  List<MetadataProvider> get providers => List.unmodifiable(_providers);

  List<MetadataProvider> providersForType(WorkType type) {
    return _providers.where((provider) => provider.supportsType(type)).toList();
  }

  MetadataProvider providerById(String providerId) {
    final provider = _providers.cast<MetadataProvider?>().firstWhere(
          (candidate) => candidate?.id == providerId,
          orElse: () => null,
        );
    if (provider == null) {
      throw const MetadataException('未找到指定的数据源。');
    }
    return provider;
  }

  Future<List<MetadataSearchResult>> search({
    required String providerId,
    required String keyword,
    required WorkType type,
  }) async {
    final provider = providerById(providerId);
    if (!provider.supportsType(type)) {
      throw const MetadataException('该数据源暂不支持当前类型。');
    }

    final normalizedKeyword = keyword.trim();
    if (normalizedKeyword.isEmpty) {
      return const [];
    }

    return provider.search(keyword: normalizedKeyword, type: type);
  }

  Future<MetadataWorkDetail> getDetail({
    required String providerId,
    required String sourceId,
    WorkType? requestedType,
  }) async {
    final provider = providerById(providerId);
    return provider.getDetail(
      sourceId,
      requestedType: requestedType,
    );
  }
}
