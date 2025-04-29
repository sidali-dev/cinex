class Movie {
  final int id;
  final String? title;
  final String? overview;
  final String? posterPath;
  final String? backdropPath;
  final String? releaseDate;
  final double? voteAverage;
  final int? voteCount;
  final List<int>? genreIds;
  final bool? adult;
  final String? originalLanguage;
  final String? originalTitle;
  final double? popularity;
  final bool? video;

  Movie({
    required this.id,
    this.title,
    this.overview,
    this.posterPath,
    this.backdropPath,
    this.releaseDate,
    this.voteAverage,
    this.voteCount,
    this.genreIds,
    this.adult,
    this.originalLanguage,
    this.originalTitle,
    this.popularity,
    this.video,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] as int,
      title: json['title'] as String?,
      overview: json['overview'] as String?,
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      releaseDate: json['release_date'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: json['vote_count'] as int?,
      genreIds: (json['genre_ids'] as List<dynamic>?)?.cast<int>(),
      adult: json['adult'] as bool?,
      originalLanguage: json['original_language'] as String?,
      originalTitle: json['original_title'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      video: json['video'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'overview': overview,
      'poster_path': posterPath,
      'backdrop_path': backdropPath,
      'release_date': releaseDate,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'genre_ids': genreIds,
      'adult': adult,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'popularity': popularity,
      'video': video,
    };
  }
}
