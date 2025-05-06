import 'package:cinex/app/models/movie/movie.dart';
import 'package:cinex/app/services/tmdb_service.dart';
import 'package:get/get.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../models/movie/movie_details.dart';

class TrailerController extends GetxController {
  TrailerController({
    required this.movie,
  });
  final RxBool isLoading = false.obs;
  final RxBool isError = false.obs;

  final Movie movie;
  MovieDetails? movieDetails;
  String? videoId;

  late YoutubePlayerController youtubeController;

  @override
  void onInit() {
    super.onInit();
    youtubeController = YoutubePlayerController(
      params: YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
        color: "Red",
        pointerEvents: PointerEvents.auto,
      ),
    );

    _fetchDetails();
  }

  Future<void> _onInitTrailer() async {
    await youtubeController.loadVideoById(videoId: videoId!);
  }

  _fetchDetails() async {
    try {
      isLoading.value = true;

      final response = await TmdbService().getMovieDetails(movie.id);
      movieDetails = response;
      _getTrailer();
      _onInitTrailer();
    } catch (e) {
      isError.value = true;
    } finally {
      isLoading.value = false;
    }
  }

  _getTrailer() {
    movieDetails?.videos?.results?.forEach((element) {
      if (element.type == "Trailer" && element.site == "YouTube") {
        videoId = element.key;
      }
    });
  }
}
