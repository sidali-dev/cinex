class Genre {
  int id;
  String name;

  Genre({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory Genre.fromJson(Map<String, dynamic> map) {
    return Genre(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }
}
