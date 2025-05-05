import 'package:get/get.dart';

import '../models/movie/movie.dart';
import '../services/tmdb_service.dart';

class HomeMoviesController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxBool isError = false.obs;

  final RxList<Movie> topRatedMovies = <Movie>[].obs;
  final RxList<Movie> popularMovies = <Movie>[].obs;
  final RxList<Movie> upcomingMovies = <Movie>[].obs;
  final RxList<Movie> nowPlayingMovies = <Movie>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    isLoading.value = true;
    try {
      final TmdbService tmdbService = TmdbService();

      final topRatedResponse = await tmdbService.getTopRatedMovies();
      final popularResponse = await tmdbService.getPopularMovies();
      final upcomingResponse = await tmdbService.getUpcomingMovies();
      final nowPlayingResponse = await tmdbService.getNowPlayingMovies();

      topRatedMovies.value = topRatedResponse.results;
      popularMovies.value = popularResponse.results;
      upcomingMovies.value = upcomingResponse.results;
      nowPlayingMovies.value = nowPlayingResponse.results;
    } catch (_) {
      isError.value = true;
    } finally {
      isLoading.value = false;
    }
  }
}
