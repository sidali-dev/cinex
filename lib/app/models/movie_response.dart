import 'movie/movie.dart';

class MovieResponse {
  final int page;
  final List<Movie> results;
  final int totalPages;
  final int totalResults;

  MovieResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MovieResponse.fromJson(Map<String, dynamic> json) {
    return MovieResponse(
      page: json['page'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as int,
      totalResults: json['total_results'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'results': results.map((e) => e.toJson()).toList(),
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }
}
