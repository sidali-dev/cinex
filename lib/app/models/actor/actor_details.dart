import 'package:cinex/app/models/actor/movie_credits.dart';
import 'package:cinex/app/models/actor/tv_credits.dart';

class ActorDetails {
  final int id;
  final String name;
  final bool? adult;
  final List<String>? alsoKnownAs;
  final String? biography;
  final String? birthday;
  final String? deathday;
  final int? gender;
  final String? homepage;
  final String? imdbId;
  final String? knownForDepartment;
  final String? placeOfBirth;
  final double? popularity;
  final String? profilePath;
  final MovieCredits? movieCredits;
  final TvCredits? tvCredits;

  ActorDetails({
    required this.id,
    required this.name,
    this.adult,
    this.alsoKnownAs,
    this.biography,
    this.birthday,
    this.deathday,
    this.gender,
    this.homepage,
    this.imdbId,
    this.knownForDepartment,
    this.placeOfBirth,
    this.popularity,
    this.profilePath,
    this.movieCredits,
    this.tvCredits,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'adult': adult,
      'also_known_as': alsoKnownAs,
      'biography': biography,
      'birthday': birthday,
      'deathday': deathday,
      'gender': gender,
      'homepage': homepage,
      'imdb_id': imdbId,
      'known_for_department': knownForDepartment,
      'name': name,
      'place_of_birth': placeOfBirth,
      'popularity': popularity,
      'profile_path': profilePath,
      'tv_credits': tvCredits?.toJson(),
    };
  }

  factory ActorDetails.fromJson(Map<String, dynamic> json) {
    return ActorDetails(
      id: json['id'] as int,
      name: json['name'] as String,
      adult: json['adult'] != null ? json['adult'] as bool : null,
      alsoKnownAs: (json['also_known_as'] as List<dynamic>?)?.cast<String>(),
      biography: json['biography'] as String?,
      birthday: json['birthday'] as String?,
      deathday: json['deathday'] as String?,
      gender: json['gender'] as int?,
      homepage: json['homepage'] as String?,
      imdbId: json['imdb_id'] as String?,
      knownForDepartment: json['known_for_department'] as String?,
      placeOfBirth: json['place_of_birth'] as String?,
      popularity: json['popularity'] as double?,
      profilePath: json['profile_path'] as String?,
      movieCredits: json['movie_credits'] != null
          ? MovieCredits.fromJson(json['movie_credits'] as Map<String, dynamic>)
          : null,
      tvCredits: json['tv_credits'] != null
          ? TvCredits.fromJson(json['tv_credits'] as Map<String, dynamic>)
          : null,
    );
  }
}
