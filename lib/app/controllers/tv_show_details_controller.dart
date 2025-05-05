import 'package:cinex/app/models/movie/movie.dart';
import 'package:cinex/app/models/tv_show/season.dart';
import 'package:cinex/app/models/tv_show/season_details.dart';
import 'package:cinex/app/models/tv_show/tv_show_details.dart';
import 'package:get/get.dart';

import '../services/tmdb_service.dart';

class TvShowDetailsController extends GetxController {
  final Movie tvShow;
  TvShowDetailsController({required this.tvShow});

  TvShowDetails? tvShowDetails;

  Rx<Season> selectedSeason = Season().obs;
  Rx<SeasonDetails?> selectedSeasonDetails = Rx<SeasonDetails?>(null);

  final isLoading = false.obs;
  final isError = false.obs;

  final isSeasonLoading = false.obs;
  final isSeasonError = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchDetails();
  }

  changeSelectedSeason(Season season) async {
    selectedSeason.value = season;
    await fetchSeasonDetails();
  }

  fetchSeasonDetails() async {
    try {
      isSeasonLoading.value = true;
      final response = await TmdbService().getTvShowSeasonDetails(
        tvShow.id,
        selectedSeason.value.seasonNumber!,
      );
      selectedSeasonDetails.value = response;
    } catch (e) {
      isSeasonError.value = true;
    } finally {
      isSeasonLoading.value = false;
    }
  }

  fetchDetails() async {
    try {
      isLoading.value = true;

      final response = await TmdbService().getTvShowDetails(tvShow.id);
      tvShowDetails = response;
      if (tvShowDetails!.seasons != null) {
        await changeSelectedSeason(tvShowDetails!.seasons![0]);
      }
    } catch (e) {
      isError.value = true;
    } finally {
      isLoading.value = false;
    }
  }
}
