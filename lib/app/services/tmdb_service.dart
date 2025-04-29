import 'package:cinex/app/models/actor/actor_details.dart';
import 'package:cinex/app/models/tv_show/tv_show_details.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/movie/movie_details.dart';
import '../models/movie_response.dart';
import '../models/video_reponse.dart';

class TMDbService {
  final Dio _dio;
  final String _baseUrl = 'https://api.themoviedb.org/3';
  late final String _apiKey;

  TMDbService() : _dio = Dio() {
    _apiKey = dotenv.env['TMDB_KEY'] ?? '';
    _dio.options.baseUrl = _baseUrl;
    _dio.options.queryParameters = {'api_key': _apiKey};
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }

  // Get popular movies
  Future<MovieResponse> getPopularMovies({int page = 1}) async {
    try {
      final response = await _dio.get(
        '/movie/popular',
        queryParameters: {'page': page},
      );
      return MovieResponse.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch popular movies: $e');
    }
  }

  // Get top rated movies
  Future<MovieResponse> getTopRatedMovies({int page = 1}) async {
    try {
      final response = await _dio.get(
        '/movie/top_rated',
        queryParameters: {'page': page},
      );
      return MovieResponse.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch top rated movies: $e');
    }
  }

  // Get upcoming movies
  Future<MovieResponse> getUpcomingMovies({int page = 1}) async {
    try {
      final response = await _dio.get(
        '/movie/upcoming',
        queryParameters: {'page': page},
      );
      return MovieResponse.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch upcoming movies: $e');
    }
  }

  // Get now playing movies
  Future<MovieResponse> getNowPlayingMovies({int page = 1}) async {
    try {
      final response = await _dio.get(
        '/movie/now_playing',
        queryParameters: {'page': page},
      );
      return MovieResponse.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch now playing movies: $e');
    }
  }

  // Get movie details
  Future<MovieDetails> getMovieDetails(int movieId) async {
    try {
      final response = await _dio.get(
        '/movie/$movieId',
        queryParameters: {
          'append_to_response': 'credits,videos',
        },
      );
      return MovieDetails.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch movie details: $e');
    }
  }

  // Get TV show details
  Future<TvShowDetails> getTvShowDetails(int tvShowId) async {
    try {
      final response = await _dio.get(
        '/tv/$tvShowId',
        queryParameters: {
          // 'append_to_response': 'credits,videos',
        },
      );
      print("=================================================");
      return TvShowDetails.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch movie details: $e');
    }
  }

  // Get actor details
  Future<ActorDetails> getActorDetails(int actorId) async {
    try {
      final response = await _dio.get(
        '/person/$actorId',
        queryParameters: {
          'append_to_response': 'movie_credits,tv_credits',
        },
      );
      return ActorDetails.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch actor details: $e');
    }
  }

  // Get movie videos
  Future<VideoResponse> getMovieVideos(int movieId) async {
    try {
      final response = await _dio.get(
        '/movie/$movieId/videos',
      );
      return VideoResponse.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch movie videos: $e');
    }
  }

  // Search movies
  Future<MovieResponse> searchMovies(String query, {int page = 1}) async {
    try {
      final response = await _dio.get(
        '/search/movie',
        queryParameters: {
          'query': query,
          'page': page,
        },
      );
      return MovieResponse.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to search movies: $e');
    }
  }

  // Get similar movies
  Future<MovieResponse> getSimilarMovies(int movieId, {int page = 1}) async {
    try {
      final response = await _dio.get(
        '/movie/$movieId/similar',
        queryParameters: {'page': page},
      );
      return MovieResponse.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch similar movies: $e');
    }
  }

  // Get movie recommendations
  Future<MovieResponse> getMovieRecommendations(int movieId,
      {int page = 1}) async {
    try {
      final response = await _dio.get(
        '/movie/$movieId/recommendations',
        queryParameters: {'page': page},
      );
      return MovieResponse.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch movie recommendations: $e');
    }
  }
}
