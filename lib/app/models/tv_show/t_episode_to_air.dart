class TEpisodeToAir {
  int id;
  String name;
  String overview;
  int voteAverage;
  int voteCount;
  String airDate;
  int episodeNumber;
  String episodeType;
  String productionCode;
  int? runtime;
  int seasonNumber;
  int showId;
  String stillPath;

  TEpisodeToAir({
    required this.id,
    required this.name,
    required this.overview,
    required this.voteAverage,
    required this.voteCount,
    required this.airDate,
    required this.episodeNumber,
    required this.episodeType,
    required this.productionCode,
    this.runtime,
    required this.seasonNumber,
    required this.showId,
    required this.stillPath,
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

  factory TEpisodeToAir.fromJson(Map<String, dynamic> map) {
    return TEpisodeToAir(
      id: map['id'] as int,
      name: map['name'] as String,
      overview: map['overview'] as String,
      voteAverage: map['vote_average'] as int,
      voteCount: map['vote_count'] as int,
      airDate: map['air_date'] as String,
      episodeNumber: map['episode_number'] as int,
      episodeType: map['episode_type'] as String,
      productionCode: map['production_code'] as String,
      runtime: map['runtime'] as int?,
      seasonNumber: map['season_number'] as int,
      showId: map['show_id'] as int,
      stillPath: map['still_path'] as String,
    );
  }
}
