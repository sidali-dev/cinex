import 'package:cinex/app/models/movie/movie.dart';
import 'package:cinex/app/models/tv_show/tv_show_details.dart';
import 'package:get/get.dart';

import '../services/tmdb_service.dart';

class TvShowDetailsController extends GetxController {
  final Movie tvShow;
  TvShowDetailsController({required this.tvShow});
  TvShowDetails? tvShowDetails;
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

      final response = await TMDbService().getTvShowDetails(tvShow.id);
      tvShowDetails = response;
    } catch (e) {
      print(e);
      isError.value = true;
    } finally {
      isLoading.value = false;
    }
  }
}
