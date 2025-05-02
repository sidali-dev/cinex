class SearchResultsPerson {
  final int id;
  final String name;
  final String mediaType;
  final String? originalName;
  final bool? adult;
  final double? popularity;
  final int? gender;
  final String? knownForDepartment;
  final String? profilePath;

  SearchResultsPerson({
    required this.id,
    required this.name,
    required this.mediaType,
    this.originalName,
    this.adult,
    this.popularity,
    this.gender,
    this.knownForDepartment,
    this.profilePath,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'media_type': mediaType,
      'original_name': originalName,
      'adult': adult,
      'popularity': popularity,
      'gender': gender,
      'known_for_department': knownForDepartment,
      'profile_path': profilePath,
    };
  }

  factory SearchResultsPerson.fromJson(Map<String, dynamic> map) {
    return SearchResultsPerson(
      id: map['id'] as int,
      name: map['name'] as String,
      mediaType: map['media_type'] as String,
      originalName: map['original_name'] as String?,
      adult: map['adult'] as bool?,
      popularity: map['popularity'] as double?,
      gender: map['gender'] as int?,
      knownForDepartment: map['known_for_department'] as String?,
      profilePath: map['profile_path'] as String?,
    );
  }
}
