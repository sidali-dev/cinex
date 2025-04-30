class Network {
  int id;
  String? logoPath;
  String? name;
  String? originCountry;

  Network({
    required this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'logo_path': logoPath,
      'name': name,
      'origin_country': originCountry,
    };
  }

  factory Network.fromJson(Map<String, dynamic> map) {
    return Network(
      id: map['id'] as int,
      logoPath: map['logo_path'] as String?,
      name: map['name'] as String?,
      originCountry: map['origin_country'] as String?,
    );
  }
}
