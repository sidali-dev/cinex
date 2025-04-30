class SpokenLanguage {
  String? englishName;
  String? iso6391;
  String? name;

  SpokenLanguage({
    this.englishName,
    this.iso6391,
    this.name,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'english_name': englishName,
      'iso6391': iso6391,
      'name': name,
    };
  }

  factory SpokenLanguage.fromJson(Map<String, dynamic> map) {
    return SpokenLanguage(
      englishName: map['english_name'] as String?,
      iso6391: map['iso6391'] as String?,
      name: map['name'] as String?,
    );
  }
}
