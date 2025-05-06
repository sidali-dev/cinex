import 'package:cinex/app/views/generals/widgets/error_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home_tv_shows_controller.dart';
import '../../helpers/helper_functions.dart';
import '../../routes/app_pages.dart';
import '../home_movies/widgets/movies_list_row_shimmer.dart';
import '../generals/widgets/playing_now.dart';
import '../generals/widgets/playing_now_shimmer.dart';
import 'widgets/tv_shows_list_row.dart';

class HomeTvShowsView extends GetView<HomeTvShowsController> {
  const HomeTvShowsView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = HelperFunctions.screenHeight(context);
    final screenWidth = HelperFunctions.screenWidth(context);

    return Scaffold(
      body: Obx(
        () {
          if (controller.isLoading.value == true) {
            return _onLoading(screenHeight, screenWidth);
          }
          if (controller.isError.value == true) {
            return ErrorPlaceHolder(title: "SOMETHING WENT WRONG");
          }
          if (controller.isLoading.value == false ||
              controller.isError.value == false) {
            return _onSuccess(screenHeight, screenWidth);
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _onSuccess(double screenHeight, double screenWidth) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          PlayingNow(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              playingNow: controller.airingTodayShows,
              isMovies: false),
          const SizedBox(height: 48),
          TvShowsListRow(
            height: screenHeight * 0.24,
            width: screenHeight * 0.16,
            title: 'Ongoing TV Shows',
            tvShows: controller.onTheAirTvShows,
            onTap: () {
              Get.toNamed(Routes.SEE_ALL_MOVIES, arguments: {
                'movies_list': controller.onTheAirTvShows,
                "title": "Ongoing TV Shows",
                "is_movies": false,
              });
            },
          ),
          const SizedBox(height: 32),
          TvShowsListRow(
            height: screenHeight * 0.24,
            width: screenHeight * 0.16,
            title: 'Popular TV Shows',
            tvShows: controller.popularTvShows,
            onTap: () {
              Get.toNamed(Routes.SEE_ALL_MOVIES, arguments: {
                'movies_list': controller.popularTvShows,
                "title": "Popular TV Shows",
                "is_movies": false,
              });
            },
          ),
          const SizedBox(height: 32),
          TvShowsListRow(
            height: screenHeight * 0.24,
            width: screenHeight * 0.16,
            title: 'Top Rated TV Shows',
            tvShows: controller.topRatedTvShows,
            onTap: () {
              Get.toNamed(Routes.SEE_ALL_MOVIES, arguments: {
                'movies_list': controller.topRatedTvShows,
                "title": "Top Rated TV Shows",
                "is_movies": false,
              });
            },
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _onLoading(double screenHeight, double screenWidth) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          PlayingNowShimmer(
              screenHeight: screenHeight, screenWidth: screenWidth),
          const SizedBox(height: 48),
          MoviesListRowShimmer(
              title: "Ongoing TV Shows",
              height: screenHeight * 0.24,
              width: screenHeight * 0.16),
          const SizedBox(height: 32),
          MoviesListRowShimmer(
              title: "Popular TV Shows",
              height: screenHeight * 0.24,
              width: screenHeight * 0.16),
          const SizedBox(height: 32),
          MoviesListRowShimmer(
              title: "Top Rated TV Shows",
              height: screenHeight * 0.24,
              width: screenHeight * 0.16),
        ],
      ),
    );
  }
}
