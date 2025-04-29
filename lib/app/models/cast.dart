class Cast {
  final int id;
  final String name;
  final String? profilePath;
  final String? character;
  final String? creditId;
  final int? order;
  final String? department;
  final String? job;

  Cast({
    required this.id,
    required this.name,
    this.profilePath,
    this.character,
    this.creditId,
    this.order,
    this.department,
    this.job,
  });

  factory Cast.fromJson(Map<String, dynamic> json) {
    return Cast(
      id: json['id'] as int,
      name: json['name'] as String,
      profilePath: json['profile_path'] as String?,
      character: json['character'] as String?,
      creditId: json['credit_id'] as String?,
      order: json['order'] as int?,
      department: json['department'] as String?,
      job: json['job'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'profile_path': profilePath,
      'character': character,
      'credit_id': creditId,
      'order': order,
      'department': department,
      'job': job,
    };
  }
}
