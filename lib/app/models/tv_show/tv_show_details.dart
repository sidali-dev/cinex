import '../genre.dart';
import '../production_country.dart';
import '../spoken_language.dart';
import 'created_by.dart';
import 'network.dart';
import 'season.dart';
import 'episode_to_air.dart';

class TvShowDetails {
  bool? adult;
  String? backdropPath;
  List<CreatedBy>? createdBy;
  List<int>? episodeRunTime;
  String? firstAirDate;
  List<Genre>? genres;
  String? homepage;
  int id;
  bool? inProduction;
  List<String>? languages;
  String? lastAirDate;
  EpisodeToAir? lastEpisodeToAir;
  String? name;
  EpisodeToAir? nextEpisodeToAir;
  List<Network>? networks;
  int? numberOfEpisodes;
  int? numberOfSeasons;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalName;
  String? overview;
  double? popularity;
  String? posterPath;
  List<Network>? productionCompanies;
  List<ProductionCountry>? productionCountries;
  List<Season>? seasons;
  List<SpokenLanguage>? spokenLanguages;
  String? status;
  String? tagline;
  String? type;
  double? voteAverage;
  int? voteCount;

  TvShowDetails({
    required this.id,
    this.adult,
    this.backdropPath,
    this.createdBy,
    this.episodeRunTime,
    this.firstAirDate,
    this.genres,
    this.homepage,
    this.inProduction,
    this.languages,
    this.lastAirDate,
    this.lastEpisodeToAir,
    this.name,
    this.nextEpisodeToAir,
    this.networks,
    this.numberOfEpisodes,
    this.numberOfSeasons,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.seasons,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.type,
    this.voteAverage,
    this.voteCount,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'adult': adult,
      'backdrop_path': backdropPath,
      'created_by': createdBy?.map((x) => x.toJson()).toList(),
      'episode_run_time': episodeRunTime,
      'first_air_date': firstAirDate,
      'genres': genres?.map((x) => x.toJson()).toList(),
      'homepage': homepage,
      'id': id,
      'in_production': inProduction,
      'languages': languages,
      'last_air_date': lastAirDate,
      'last_episode_to_air': lastEpisodeToAir?.toJson(),
      'name': name,
      'next_episode_to_air': nextEpisodeToAir?.toJson(),
      'networks': networks?.map((x) => x.toJson()).toList(),
      'number_of_episodes': numberOfEpisodes,
      'number_of_seasons': numberOfSeasons,
      'origin_country': originCountry,
      'original_language': originalLanguage,
      'original_name': originalName,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'production_companies':
          productionCompanies?.map((x) => x.toJson()).toList(),
      'production_countries':
          productionCountries?.map((x) => x.toJson()).toList(),
      'seasons': seasons?.map((x) => x.toJson()).toList(),
      'spoken_languages': spokenLanguages?.map((x) => x.toJson()).toList(),
      'status': status,
      'tagline': tagline,
      'type': type,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }

  factory TvShowDetails.fromJson(Map<String, dynamic> map) {
    return TvShowDetails(
      adult: map['adult'] as bool,
      backdropPath: map['backdrop_path'] as String,
      createdBy: (map['created_by'] as List<dynamic>)
          .map((x) => CreatedBy.fromJson(x as Map<String, dynamic>))
          .toList(),
      episodeRunTime: List<int>.from(map['episode_run_time'] as List<dynamic>),
      firstAirDate: map['first_air_date'] as String,
      genres: (map['genres'] as List<dynamic>)
          .map((x) => Genre.fromJson(x as Map<String, dynamic>))
          .toList(),
      homepage: map['homepage'] as String,
      id: map['id'] as int,
      inProduction: map['in_production'] as bool,
      languages: List<String>.from(map['languages'] as List<dynamic>),
      lastAirDate: map['last_air_date'] as String,
      lastEpisodeToAir: map['last_episode_to_air'] != null
          ? EpisodeToAir.fromJson(
              map['last_episode_to_air'] as Map<String, dynamic>)
          : null,
      name: map['name'] as String,
      nextEpisodeToAir: map['next_episode_to_air'] != null
          ? EpisodeToAir.fromJson(
              map['next_episode_to_air'] as Map<String, dynamic>)
          : null,
      networks: (map['networks'] as List<dynamic>)
          .map((x) => Network.fromJson(x as Map<String, dynamic>))
          .toList(),
      numberOfEpisodes: map['number_of_episodes'] as int,
      numberOfSeasons: map['number_of_seasons'] as int,
      originCountry: List<String>.from(map['origin_country'] as List<dynamic>),
      originalLanguage: map['original_language'] as String,
      originalName: map['original_name'] as String,
      overview: map['overview'] as String,
      popularity: (map['popularity'] as num).toDouble(),
      posterPath: map['poster_path'] as String,
      productionCompanies: (map['production_companies'] as List<dynamic>)
          .map((x) => Network.fromJson(x as Map<String, dynamic>))
          .toList(),
      productionCountries: (map['production_countries'] as List<dynamic>)
          .map((x) => ProductionCountry.fromJson(x as Map<String, dynamic>))
          .toList(),
      seasons: (map['seasons'] as List<dynamic>)
          .map((x) => Season.fromJson(x as Map<String, dynamic>))
          .toList(),
      spokenLanguages: (map['spoken_languages'] as List<dynamic>)
          .map((x) => SpokenLanguage.fromJson(x as Map<String, dynamic>))
          .toList(),
      status: map['status'] as String,
      tagline: map['tagline'] as String,
      type: map['type'] as String,
      voteAverage: (map['vote_average'] as num).toDouble(),
      voteCount: map['vote_count'] as int,
    );
  }
}
