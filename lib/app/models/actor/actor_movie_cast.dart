class ActorMoviecast {
  final int? id;
  final bool? adult;
  final String? backdropPath;
  final List<int>? genreIds;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? releaseDate;
  final String title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;
  final String? character;
  final String? job;
  final String? creditId;
  final int? order;

  ActorMoviecast({
    this.id,
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    required this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.character,
    this.job,
    this.creditId,
    this.order,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'adult': adult,
      'backdrop_path': backdropPath,
      'genre_ids': genreIds,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'release_date': releaseDate,
      'title': title,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'character': character,
      'job': job,
      'credit_id': creditId,
      'order': order,
    };
  }

  factory ActorMoviecast.fromJson(Map<String, dynamic> json) {
    return ActorMoviecast(
      id: json['id'] as int?,
      adult: json['adult'] as bool?,
      backdropPath: json['backdrop_path'] as String?,
      genreIds: (json['genre_ids'] as List<dynamic>?)?.cast<int>(),
      originalLanguage: json['original_language'] as String?,
      originalTitle: json['original_title'] as String?,
      overview: json['overview'] as String?,
      popularity: json['popularity'] as double?,
      posterPath: json['poster_path'] as String?,
      releaseDate: json['release_date'] as String?,
      title: json['title'] as String,
      video: json['video'] as bool?,
      voteAverage: json['vote_average'] as double?,
      voteCount: json['vote_count'] as int?,
      character: json['character'] as String?,
      job: json['job'] as String?,
      creditId: json['credit_id'] as String?,
      order: json['order'] as int?,
    );
  }
}
