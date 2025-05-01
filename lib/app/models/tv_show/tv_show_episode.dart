class TvShowEpisode {
  String? airDate;
  int episodeNumber;
  String? episodeType;
  int id;
  String? name;
  String? overview;
  String? productionCode;
  int? runtime;
  int? seasonNumber;
  int? showId;
  String? stillPath;
  double? voteAverage;
  int? voteCount;
  // List crew;
  // List guestStars;

  TvShowEpisode({
    required this.id,
    required this.episodeNumber,
    this.airDate,
    this.episodeType,
    this.name,
    this.overview,
    this.productionCode,
    this.runtime,
    this.seasonNumber,
    this.showId,
    this.stillPath,
    this.voteAverage,
    this.voteCount,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'air_date': airDate,
      'episode_number': episodeNumber,
      'episode_type': episodeType,
      'id': id,
      'name': name,
      'overview': overview,
      'production_code': productionCode,
      'runtime': runtime,
      'season_number': seasonNumber,
      'show_id': showId,
      'still_path': stillPath,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }

  factory TvShowEpisode.fromJson(Map<String, dynamic> map) {
    return TvShowEpisode(
      airDate: map['air_date'] as String?,
      episodeNumber: map['episode_number'] as int,
      episodeType: map['episode_type'] as String?,
      id: map['id'] as int,
      name: map['name'] as String?,
      overview: map['overview'] as String?,
      productionCode: map['production_code'] as String?,
      runtime: map['runtime'] as int?,
      seasonNumber: map['season_number'] as int?,
      showId: map['show_id'] as int?,
      stillPath: map['still_path'] as String?,
      voteAverage: map['vote_average'] as double?,
      voteCount: map['vote_count'] as int?,
    );
  }
}
