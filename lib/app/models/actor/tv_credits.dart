// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'actor_tv_cast.dart';

class TvCredits {
  final List<ActorTvCast>? cast;
  final List<ActorTvCast>? crew;

  TvCredits({
    this.cast,
    this.crew,
  });

  factory TvCredits.fromJson(Map<String, dynamic> json) {
    return TvCredits(
      cast: (json['cast'] as List<dynamic>?)
          ?.map((e) => ActorTvCast.fromJson(e as Map<String, dynamic>))
          .toList(),
      crew: (json['crew'] as List<dynamic>?)
          ?.map((e) => ActorTvCast.fromJson(e as Map<String, dynamic>))
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
