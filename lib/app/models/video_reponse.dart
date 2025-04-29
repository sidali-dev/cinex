import 'video.dart';

class VideoResponse {
  final List<Video>? results;

  VideoResponse({this.results});

  factory VideoResponse.fromJson(Map<String, dynamic> json) {
    return VideoResponse(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Video.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'results': results?.map((e) => e.toJson()).toList(),
    };
  }
}
