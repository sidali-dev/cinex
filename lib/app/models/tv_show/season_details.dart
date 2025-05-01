import 'package:cinex/app/models/tv_show/tv_show_episode.dart';

class SeasonDetails {
  String? stringId;
  String? airDate;
  List<TvShowEpisode> episodes;
  String name;
  String? overview;
  int id;
  String? posterPath;
  int seasonNumber;
  double? voteAverage;

  SeasonDetails({
    this.stringId,
    this.airDate,
    required this.episodes,
    required this.name,
    this.overview,
    required this.id,
    this.posterPath,
    required this.seasonNumber,
    this.voteAverage,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      '_id': stringId,
      'air_date': airDate,
      'episodes': episodes.map((x) => x.toJson()).toList(),
      'name': name,
      'overview': overview,
      'id': id,
      'poster_path': posterPath,
      'season_number': seasonNumber,
      'voteaverage': voteAverage,
    };
  }

  factory SeasonDetails.fromJson(Map<String, dynamic> map) {
    return SeasonDetails(
      stringId: map['_id'] as String?,
      airDate: map['air_date'] as String?,
      episodes: List<TvShowEpisode>.from(
        (map['episodes'] as List).map<TvShowEpisode>(
          (x) => TvShowEpisode.fromJson(x as Map<String, dynamic>),
        ),
      ),
      name: map['name'] as String,
      overview: map['overview'] as String?,
      id: map['id'] as int,
      posterPath: map['poster_path'] as String?,
      seasonNumber: map['season_number'] as int,
      voteAverage: map['vote_average'] as double?,
    );
  }
}
