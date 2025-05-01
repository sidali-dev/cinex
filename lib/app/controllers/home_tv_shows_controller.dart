import 'package:get/get.dart';

import '../models/movie/movie.dart';
import '../services/tmdb_service.dart';

class HomeTvShowsController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxBool isError = false.obs;

  final RxList<Movie> topRatedTvShows = <Movie>[].obs;
  final RxList<Movie> popularTvShows = <Movie>[].obs;
  final RxList<Movie> onTheAirTvShows = <Movie>[].obs;
  final RxList<Movie> airingTodayShows = <Movie>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    isLoading.value = true;
    try {
      final TMDbService tmdbService = TMDbService();

      final topRatedResponse = await tmdbService.getTopRatedTvShows();
      final popularResponse = await tmdbService.getPopularTvShows();
      final onTheAirResponse = await tmdbService.getOnTheAirTvShows();
      final airingTodayResponse = await tmdbService.getAiringTodayTvShows();

      topRatedTvShows.value = topRatedResponse.results;
      popularTvShows.value = popularResponse.results;
      onTheAirTvShows.value = onTheAirResponse.results;
      airingTodayShows.value = airingTodayResponse.results;
    } catch (e) {
      isError.value = true;
    } finally {
      isLoading.value = false;
    }
  }
}
