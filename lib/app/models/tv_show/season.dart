class Season {
  String? airDate;
  int? episodeCount;
  int? id;
  String? name;
  String? overview;
  String? posterPath;
  int? seasonNumber;
  double? voteAverage;

  Season({
    this.airDate,
    this.episodeCount,
    this.id,
    this.name,
    this.overview,
    this.posterPath,
    this.seasonNumber,
    this.voteAverage,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'air_date': airDate,
      'episode_count': episodeCount,
      'id': id,
      'name': name,
      'overview': overview,
      'poster_path': posterPath,
      'season_number': seasonNumber,
      'vote_average': voteAverage,
    };
  }

  factory Season.fromJson(Map<String, dynamic> map) {
    return Season(
      airDate: map['air_date'] as String?,
      episodeCount: map['episode_count'] as int?,
      id: map['id'] as int?,
      name: map['name'] as String?,
      overview: map['overview'] as String?,
      posterPath: map['poster_path'] as String?,
      seasonNumber: map['season_number'] as int?,
      voteAverage: map['vote_average'] as double?,
    );
  }
}
