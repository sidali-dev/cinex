import '../genre.dart';
import '../production_country.dart';
import '../spoken_language.dart';
import 'created_by.dart';
import 'network.dart';
import 'season.dart';
import 't_episode_to_air.dart';

class TvShowDetails {
  bool adult;
  String backdropPath;
  List<CreatedBy> createdBy;
  List<int> episodeRunTime;
  String firstAirDate;
  List<Genre> genres;
  String homepage;
  int id;
  bool inProduction;
  List<String> languages;
  String lastAirDate;
  TEpisodeToAir lastEpisodeToAir;
  String name;
  TEpisodeToAir nextEpisodeToAir;
  List<Network> networks;
  int numberOfEpisodes;
  int numberOfSeasons;
  List<String> originCountry;
  String originalLanguage;
  String originalName;
  String overview;
  double popularity;
  String posterPath;
  List<Network> productionCompanies;
  List<ProductionCountry> productionCountries;
  List<Season> seasons;
  List<SpokenLanguage> spokenLanguages;
  String status;
  String tagline;
  String type;
  double voteAverage;
  int voteCount;

  TvShowDetails({
    required this.adult,
    required this.backdropPath,
    required this.createdBy,
    required this.episodeRunTime,
    required this.firstAirDate,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.inProduction,
    required this.languages,
    required this.lastAirDate,
    required this.lastEpisodeToAir,
    required this.name,
    required this.nextEpisodeToAir,
    required this.networks,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.seasons,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.type,
    required this.voteAverage,
    required this.voteCount,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'adult': adult,
      'backdrop_path': backdropPath,
      'created_by': createdBy.map((x) => x.toJson()).toList(),
      'episode_run_time': episodeRunTime,
      'first_air_date': firstAirDate,
      'genres': genres.map((x) => x.toJson()).toList(),
      'homepage': homepage,
      'id': id,
      'in_production': inProduction,
      'languages': languages,
      'last_air_date': lastAirDate,
      'last_episode_to_air': lastEpisodeToAir.toJson(),
      'name': name,
      'next_episode_to_air': nextEpisodeToAir.toJson(),
      'networks': networks.map((x) => x.toJson()).toList(),
      'number_of_episodes': numberOfEpisodes,
      'number_of_seasons': numberOfSeasons,
      'origin_country': originCountry,
      'original_language': originalLanguage,
      'original_name': originalName,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'production_companies':
          productionCompanies.map((x) => x.toJson()).toList(),
      'production_countries':
          productionCountries.map((x) => x.toJson()).toList(),
      'seasons': seasons.map((x) => x.toJson()).toList(),
      'spoken_languages': spokenLanguages.map((x) => x.toJson()).toList(),
      'status': status,
      'tagline': tagline,
      'type': type,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }

  factory TvShowDetails.fromJson(Map<String, dynamic> map) {
    try {
      return TvShowDetails(
        adult: map['adult'] as bool,
        backdropPath: map['backdrop_path'] as String,
        createdBy: List<CreatedBy>.from(
          (map['created_by'] as List<int>).map<CreatedBy>(
            (x) => CreatedBy.fromJson(x as Map<String, dynamic>),
          ),
        ),
        episodeRunTime: List<int>.from(
          (map['episode_run_time'] as List<int>),
        ),
        firstAirDate: map['first_air_date'] as String,
        genres: List<Genre>.from(
          (map['genres'] as List<int>).map<Genre>(
            (x) => Genre.fromJson(x as Map<String, dynamic>),
          ),
        ),
        homepage: map['homepage'] as String,
        id: map['id'] as int,
        inProduction: map['in_production'] as bool,
        languages: List<String>.from(
          (map['languages'] as List<String>),
        ),
        lastAirDate: map['last_air_date'] as String,
        lastEpisodeToAir: TEpisodeToAir.fromJson(
            map['last_episode_to_air'] as Map<String, dynamic>),
        name: map['name'] as String,
        nextEpisodeToAir: TEpisodeToAir.fromJson(
            map['next_episode_to_air'] as Map<String, dynamic>),
        networks: List<Network>.from(
          (map['networks'] as List<int>).map<Network>(
            (x) => Network.fromJson(x as Map<String, dynamic>),
          ),
        ),
        numberOfEpisodes: map['number_of_episodes'] as int,
        numberOfSeasons: map['number_of_seasons'] as int,
        originCountry: List<String>.from(
          (map['origin_country'] as List<String>),
        ),
        originalLanguage: map['original_language'] as String,
        originalName: map['original_name'] as String,
        overview: map['overview'] as String,
        popularity: map['popularity'] as double,
        posterPath: map['poster_path'] as String,
        productionCompanies: List<Network>.from(
          (map['production_companies'] as List<int>).map<Network>(
            (x) => Network.fromJson(x as Map<String, dynamic>),
          ),
        ),
        productionCountries: List<ProductionCountry>.from(
          (map['production_countries'] as List<int>).map<ProductionCountry>(
            (x) => ProductionCountry.fromJson(x as Map<String, dynamic>),
          ),
        ),
        seasons: List<Season>.from(
          (map['seasons'] as List<int>).map<Season>(
            (x) => Season.fromJson(x as Map<String, dynamic>),
          ),
        ),
        spokenLanguages: List<SpokenLanguage>.from(
          (map['spoken_languages'] as List<int>).map<SpokenLanguage>(
            (x) => SpokenLanguage.fromJson(x as Map<String, dynamic>),
          ),
        ),
        status: map['status'] as String,
        tagline: map['tagline'] as String,
        type: map['type'] as String,
        voteAverage: map['vote_average'] as double,
        voteCount: map['vote_count'] as int,
      );
    } catch (e) {
      print(e);
      throw Exception('Failed to parse TvShowDetails: $e');
    }
  }
}
