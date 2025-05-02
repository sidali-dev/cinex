class SearchResultsTvShow {
  final int id;
  final String name;
  final String mediaType;
  final String? backdropPath;
  final String? originalName;
  final String? overview;
  final String? posterPath;
  final bool? adult;
  final String? originalLanguage;
  final List<int>? genreIds;
  final double? popularity;
  final String? firstAirDate;
  final double? voteAverage;
  final int? voteCount;
  final List<String>? originCountry;

  SearchResultsTvShow({
    required this.id,
    required this.name,
    required this.mediaType,
    this.backdropPath,
    this.originalName,
    this.overview,
    this.posterPath,
    this.adult,
    this.originalLanguage,
    this.genreIds,
    this.popularity,
    this.firstAirDate,
    this.voteAverage,
    this.voteCount,
    this.originCountry,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'backdrop_path': backdropPath,
      'id': id,
      'name': name,
      'media_type': mediaType,
      'original_name': originalName,
      'overview': overview,
      'poster_path': posterPath,
      'adult': adult,
      'original_language': originalLanguage,
      'genre_ids': genreIds,
      'popularity': popularity,
      'firstAir_date': firstAirDate,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'origin_country': originCountry,
    };
  }

  factory SearchResultsTvShow.fromJson(Map<String, dynamic> map) {
    return SearchResultsTvShow(
      id: map['id'] as int,
      name: map['name'] as String,
      mediaType: map['media_type'] as String,
      backdropPath: map['backdrop_path'] as String?,
      originalName: map['original_name'] as String?,
      overview: map['overview'] as String?,
      posterPath: map['poster_path'] as String?,
      adult: map['adult'] as bool?,
      originalLanguage: map['original_language'] as String?,
      genreIds: (map['genre_ids'] as List<dynamic>?)?.cast<int>(),
      popularity: map['popularity'] as double?,
      firstAirDate: map['first_air_date'] as String?,
      voteAverage: map['vote_average'] as double?,
      voteCount: map['vote_count'] as int?,
      originCountry: (map['origin_country'] as List<dynamic>?)?.cast<String>(),
    );
  }
}
