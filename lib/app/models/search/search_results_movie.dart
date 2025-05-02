class SearchResultsMovie {
  final int id;
  final String title;
  final String mediaType;
  final String? backdropPath;
  final String? originalTitle;
  final String? overview;
  final String? posterPath;
  final bool? adult;
  final String? originalLanguage;
  final List<int>? genreIds;
  final double? popularity;
  final String? releaseDate;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  SearchResultsMovie({
    required this.id,
    required this.title,
    required this.mediaType,
    this.backdropPath,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.adult,
    this.originalLanguage,
    this.genreIds,
    this.popularity,
    this.releaseDate,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'backdrop_path': backdropPath,
      'original_title': originalTitle,
      'overview': overview,
      'poster_path': posterPath,
      'media_type': mediaType,
      'adult': adult,
      'original_language': originalLanguage,
      'genre_ids': genreIds,
      'popularity': popularity,
      'release_date': releaseDate,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }

  factory SearchResultsMovie.fromJson(Map<String, dynamic> map) {
    return SearchResultsMovie(
      id: map['id'] as int,
      title: map['title'] as String,
      mediaType: map['media_type'] as String,
      backdropPath: map['backdrop_path'] as String?,
      originalTitle: map['original_title'] as String?,
      overview: map['overview'] as String?,
      posterPath: map['poster_path'] as String?,
      adult: map['adult'] != null ? map['adult'] as bool : null,
      originalLanguage: map['original_language'] as String?,
      genreIds: (map['genre_ids'] as List<dynamic>?)?.cast<int>(),
      popularity: map['popularity'] as double?,
      releaseDate: map['release_date'] as String?,
      video: map['video'] as bool?,
      voteAverage: map['vote_average'] as double?,
      voteCount: map['vote_count'] as int?,
    );
  }
}
