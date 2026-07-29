enum WorkType {
  anime,
  manga,
  novel,
  game,
  movie;

  String get label {
    return switch (this) {
      WorkType.anime => '动画',
      WorkType.manga => '漫画',
      WorkType.novel => '小说',
      WorkType.game => '游戏',
      WorkType.movie => '电影',
    };
  }

  static WorkType fromName(String value) {
    return WorkType.values.firstWhere(
      (type) => type.name == value,
      orElse: () => WorkType.anime,
    );
  }
}
