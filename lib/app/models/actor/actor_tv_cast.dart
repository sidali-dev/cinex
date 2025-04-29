class ActorTvCast {
  final bool? adult;
  final String? backdropPath;
  final List<int>? genreIds;
  final int? id;
  final List<String>? originCountry;
  final String? originalLanguage;
  final String? originalName;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? firstAirDate;
  final String? name;
  final double? voteAverage;
  final int? voteCount;
  final String? character;
  final String? creditId;
  final int? episodeCount;
  final String? job;

  ActorTvCast({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.firstAirDate,
    this.name,
    this.voteAverage,
    this.voteCount,
    this.character,
    this.creditId,
    this.episodeCount,
    this.job,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'adult': adult,
      'backdrop_path': backdropPath,
      'genre_ids': genreIds,
      'id': id,
      'origin_country': originCountry,
      'original_canguage': originalLanguage,
      'original_name': originalName,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'first_air_date': firstAirDate,
      'title': name,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'character': character,
      'creditId': creditId,
      'episode_count': episodeCount,
      'job': job,
    };
  }

  factory ActorTvCast.fromJson(Map<String, dynamic> json) {
    return ActorTvCast(
      adult: json['adult'] as bool?,
      backdropPath: json['backdrop_path'] as String?,
      genreIds: (json['genre_ids'] as List<dynamic>?)?.cast<int>(),
      id: json['id'] as int?,
      originCountry: (json['origin_country'] as List<dynamic>?)?.cast<String>(),
      originalLanguage: json['original_language'] as String?,
      originalName: json['original_name'] as String?,
      overview: json['overview'] as String?,
      popularity: json['popularity'] as double?,
      posterPath: json['poster_path'] as String?,
      firstAirDate: json['first_air_date'] as String?,
      name: json['name'] as String?,
      voteAverage: json['vote_average'] as double?,
      voteCount: json['vote_count'] as int?,
      character: json['character'] as String?,
      creditId: json['credit_id'] as String?,
      episodeCount: json['episode_count'] as int?,
      job: json['job'] as String?,
    );
  }
}
