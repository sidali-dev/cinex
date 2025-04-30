class EpisodeToAir {
  int id;
  String? name;
  String? overview;
  double? voteAverage;
  int? voteCount;
  String? airDate;
  int? episodeNumber;
  String? episodeType;
  String? productionCode;
  int? runtime;
  int? seasonNumber;
  int? showId;
  String? stillPath;

  EpisodeToAir({
    required this.id,
    this.name,
    this.overview,
    this.voteAverage,
    this.voteCount,
    this.airDate,
    this.episodeNumber,
    this.episodeType,
    this.productionCode,
    this.runtime,
    this.seasonNumber,
    this.showId,
    this.stillPath,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'overview': overview,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'air_date': airDate,
      'episode_number': episodeNumber,
      'episode_type': episodeType,
      'production_code': productionCode,
      'runtime': runtime,
      'season_number': seasonNumber,
      'show_id': showId,
      'still_path': stillPath,
    };
  }

  factory EpisodeToAir.fromJson(Map<String, dynamic> map) {
    return EpisodeToAir(
      id: map['id'] as int,
      name: map['name'] as String?,
      overview: map['overview'] as String?,
      voteAverage: map['vote_average'] as double?,
      voteCount: map['vote_count'] as int?,
      airDate: map['air_date'] as String?,
      episodeNumber: map['episode_number'] as int?,
      episodeType: map['episode_type'] as String?,
      productionCode: map['production_code'] as String?,
      runtime: map['runtime'] as int?,
      seasonNumber: map['season_number'] as int?,
      showId: map['show_id'] as int?,
      stillPath: map['still_path'] as String?,
    );
  }
}
