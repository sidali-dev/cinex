import 'cast.dart';

class Credits {
  final List<Cast>? cast;
  final List<Cast>? crew;

  Credits({this.cast, this.crew});

  factory Credits.fromJson(Map<String, dynamic> json) {
    return Credits(
      cast: (json['cast'] as List<dynamic>?)
          ?.map((e) => Cast.fromJson(e as Map<String, dynamic>))
          .toList(),
      crew: (json['crew'] as List<dynamic>?)
          ?.map((e) => Cast.fromJson(e as Map<String, dynamic>))
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
