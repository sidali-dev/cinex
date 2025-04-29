import 'package:cinex/app/controllers/home_controller.dart';
import 'package:cinex/app/controllers/theme_controller.dart';
import 'package:cinex/app/helpers/helper_functions.dart';
import 'package:cinex/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/movies_list_row.dart';
import 'widgets/movies_list_row_shimmer.dart';
import 'widgets/playing_now.dart';
import 'widgets/playing_now_shimmer.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = HelperFunctions.screenHeight(context);
    final screenWidth = HelperFunctions.screenWidth(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ThemeController themeController = Get.find();
          themeController.switchTheme();
        },
        child: Icon(Icons.lightbulb_outlined),
      ),
      body: Obx(
        () {
          if (controller.isLoading.value == true) {
            return _onLoading(screenHeight, screenWidth);
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
              playingNow: controller.nowPlayingMovies),
          const SizedBox(height: 48),
          MoviesListRow(
            height: screenHeight * 0.24,
            width: screenHeight * 0.16,
            title: 'Upcoming Movies',
            movies: controller.upcomingMovies,
            onTap: () {
              Get.toNamed(Routes.SEE_ALL_MOVIES, arguments: {
                'movies_list': controller.upcomingMovies,
                "title": "Upcoming Movies",
              });
            },
          ),
          const SizedBox(height: 32),
          MoviesListRow(
            height: screenHeight * 0.24,
            width: screenHeight * 0.16,
            title: 'Popular Movies',
            movies: controller.popularMovies,
            onTap: () {
              Get.toNamed(Routes.SEE_ALL_MOVIES, arguments: {
                'movies_list': controller.popularMovies,
                "title": "Popular Movies",
              });
            },
          ),
          const SizedBox(height: 32),
          MoviesListRow(
            height: screenHeight * 0.24,
            width: screenHeight * 0.16,
            title: 'Top Rated Movies',
            movies: controller.topRatedMovies,
            onTap: () {
              Get.toNamed(Routes.SEE_ALL_MOVIES, arguments: {
                'movies_list': controller.topRatedMovies,
                "title": "Top Rated Movies",
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
              title: "Upcoming Movies",
              height: screenHeight * 0.24,
              width: screenHeight * 0.16),
          const SizedBox(height: 32),
          MoviesListRowShimmer(
              title: "Popular Movies",
              height: screenHeight * 0.24,
              width: screenHeight * 0.16),
          const SizedBox(height: 32),
          MoviesListRowShimmer(
              title: "Top Rated Movies",
              height: screenHeight * 0.24,
              width: screenHeight * 0.16),
        ],
      ),
    );
  }
}
