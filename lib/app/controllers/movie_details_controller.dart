import 'package:cinex/app/services/tmdb_service.dart';
import 'package:get/get.dart';

import '../models/movie/movie.dart';
import '../models/movie/movie_details.dart';

class MovieDetailsController extends GetxController {
  final Movie movie;
  MovieDetailsController({required this.movie});

  MovieDetails? movieDetails;
  final isLoading = false.obs;
  final isError = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchDetails();
  }

  fetchDetails() async {
    try {
      isLoading.value = true;

      final response = await TMDbService().getMovieDetails(movie.id);
      movieDetails = response;
    } catch (e) {
      isError.value = true;
    } finally {
      isLoading.value = false;
    }
  }
}
