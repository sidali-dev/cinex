import 'package:cinex/app/models/actor/actor_movie_cast.dart';

class MovieCredits {
  final List<ActorMoviecast>? cast;
  final List<ActorMoviecast>? crew;

  MovieCredits({
    this.cast,
    this.crew,
  });

  factory MovieCredits.fromJson(Map<String, dynamic> json) {
    return MovieCredits(
      cast: (json['cast'] as List<dynamic>?)
          ?.map((e) => ActorMoviecast.fromJson(e as Map<String, dynamic>))
          .toList(),
      crew: (json['crew'] as List<dynamic>?)
          ?.map((e) => ActorMoviecast.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cast': cast?.map((e) => e.toJson()).toList(),
      'crew': crew?.map((e) => e.toJson()).toList(),
    };
  }
}
