class CreatedBy {
  int id;
  String creditId;
  String name;
  String originalName;
  int gender;
  String? profilePath;

  CreatedBy({
    required this.id,
    required this.creditId,
    required this.name,
    required this.originalName,
    required this.gender,
    required this.profilePath,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'credit_id': creditId,
      'name': name,
      'original_name': originalName,
      'gender': gender,
      'profile_path': profilePath,
    };
  }

  factory CreatedBy.fromJson(Map<String, dynamic> map) {
    return CreatedBy(
      id: map['id'] as int,
      creditId: map['credit_id'] as String,
      name: map['name'] as String,
      originalName: map['original_name'] as String,
      gender: map['gender'] as int,
      profilePath: map['profile_path'] as String?,
    );
  }
}
