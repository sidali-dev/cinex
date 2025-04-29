import '../credits.dart';
import '../genre.dart';
import '../production_company.dart';
import '../production_country.dart';
import '../spoken_language.dart';
import '../video_reponse.dart';

class MovieDetails {
  final int id;
  final String title;
  final String? overview;
  final String? posterPath;
  final String? backdropPath;
  final String? releaseDate;
  final double? voteAverage;
  final int? voteCount;
  final List<Genre>? genres;
  final int? runtime;
  final String? status;
  final String? originalLanguage;
  final String? originalTitle;
  final double? popularity;
  final Credits? credits;
  final VideoResponse? videos;
  final bool adult;
  final dynamic belongsToCollection;
  final int? budget;
  final String? homepage;
  final String? imdbId;
  final List<String>? originCountry;
  final List<ProductionCompany>? productionCompanies;
  final List<ProductionCountry>? productionCountries;
  final int? revenue;
  final List<SpokenLanguage>? spokenLanguages;
  final String? tagline;
  final bool video;

  MovieDetails({
    required this.id,
    required this.title,
    this.overview,
    this.posterPath,
    this.backdropPath,
    this.releaseDate,
    this.voteAverage,
    this.voteCount,
    this.genres,
    this.runtime,
    this.status,
    this.originalLanguage,
    this.originalTitle,
    this.popularity,
    this.credits,
    this.videos,
    required this.adult,
    this.belongsToCollection,
    this.budget,
    this.homepage,
    this.imdbId,
    this.originCountry,
    this.productionCompanies,
    this.productionCountries,
    this.revenue,
    this.spokenLanguages,
    this.tagline,
    required this.video,
  });

  factory MovieDetails.fromJson(Map<String, dynamic> json) {
    return MovieDetails(
      id: json['id'] as int,
      title: json['title'] as String,
      overview: json['overview'] as String?,
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      releaseDate: json['release_date'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: json['vote_count'] as int?,
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
      runtime: json['runtime'] as int?,
      status: json['status'] as String?,
      originalLanguage: json['original_language'] as String?,
      originalTitle: json['original_title'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      credits: json['credits'] != null
          ? Credits.fromJson(json['credits'] as Map<String, dynamic>)
          : null,
      videos: json['videos'] != null
          ? VideoResponse.fromJson(json['videos'] as Map<String, dynamic>)
          : null,
      adult: json['adult'] as bool,
      belongsToCollection: json['belongs_to_collection'],
      budget: json['budget'] as int?,
      homepage: json['homepage'] as String?,
      imdbId: json['imdb_id'] as String?,
      originCountry: (json['origin_country'] as List<dynamic>?)?.cast<String>(),
      productionCompanies: (json['production_companies'] as List<dynamic>?)
          ?.map((e) => ProductionCompany.fromJson(e as Map<String, dynamic>))
          .toList(),
      productionCountries: (json['production_countries'] as List<dynamic>?)
          ?.map((e) => ProductionCountry.fromJson(e as Map<String, dynamic>))
          .toList(),
      revenue: json['revenue'] as int?,
      spokenLanguages: (json['spoken_languages'] as List<dynamic>?)
          ?.map((e) => SpokenLanguage.fromJson(e as Map<String, dynamic>))
          .toList(),
      tagline: json['tagline'] as String?,
      video: json['video'] as bool,
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
      'genres': genres?.map((e) => e.toJson()).toList(),
      'runtime': runtime,
      'status': status,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'popularity': popularity,
      'credits': credits?.toJson(),
      'videos': videos?.toJson(),
      'adult': adult,
      'belongs_to_collection': belongsToCollection,
      'budget': budget,
      'homepage': homepage,
      'imdb_id': imdbId,
      'origin_country': originCountry,
      'production_companies':
          productionCompanies?.map((e) => e.toJson()).toList(),
      'production_countries':
          productionCountries?.map((e) => e.toJson()).toList(),
      'revenue': revenue,
      'spoken_languages': spokenLanguages?.map((e) => e.toJson()).toList(),
      'tagline': tagline,
      'video': video,
    };
  }
}
