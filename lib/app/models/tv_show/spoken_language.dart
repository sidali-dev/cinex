class SpokenLanguage {
  String englishName;
  String iso6391;
  String name;

  SpokenLanguage({
    required this.englishName,
    required this.iso6391,
    required this.name,
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
      englishName: map['english_name'] as String,
      iso6391: map['iso6391'] as String,
      name: map['name'] as String,
    );
  }
}
