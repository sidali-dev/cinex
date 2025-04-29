class Video {
  final String id;
  final String? iso6391;
  final String? iso31661;
  final String key;
  final String name;
  final String site;
  final int size;
  final String type;
  final bool official;
  final DateTime publishedAt;

  Video({
    required this.id,
    this.iso6391,
    this.iso31661,
    required this.key,
    required this.name,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.publishedAt,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json['id'] as String,
      iso6391: json['iso_639_1'] as String?,
      iso31661: json['iso_3166_1'] as String?,
      key: json['key'] as String,
      name: json['name'] as String,
      site: json['site'] as String,
      size: json['size'] as int,
      type: json['type'] as String,
      official: json['official'] as bool,
      publishedAt: DateTime.parse(json['published_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'iso_639_1': iso6391,
      'iso_3166_1': iso31661,
      'key': key,
      'name': name,
      'site': site,
      'size': size,
      'type': type,
      'official': official,
      'published_at': publishedAt.toIso8601String(),
    };
  }
}
