import 'package:cinex/app/constants/png.dart';
import 'package:cinex/app/constants/tmdb_constants.dart';
import 'package:cinex/app/helpers/helper_functions.dart';
import 'package:cinex/app/models/movie/movie.dart';
import 'package:cinex/app/routes/app_pages.dart';
import 'package:cinex/app/views/generals/widgets/auto_scrolling_text.dart';
import 'package:cinex/app/views/generals/widgets/read_more_text.dart';
import 'package:cinex/app/views/home_movies/widgets/movies_list_row.dart';
import 'package:cinex/app/views/home_tv_shows/widgets/tv_shows_list_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/actor_profile_controller.dart';
import '../../models/cast.dart';

class ActorProfileView extends GetView<ActorProfileController> {
  const ActorProfileView({super.key});

  //to help the view decide which controller to use
  @override
  String? get tag => (Get.arguments["cast"] as Cast).id.toString();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = HelperFunctions.screenWidth(context);
    final double screenHeight = HelperFunctions.screenHeight(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Actor Profile"),
        centerTitle: true,
      ),
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (controller.isError.value) {
            return const Center(
              child: Text("ERROR LOADING DATA"),
            );
          }

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        foregroundImage: NetworkImage(
                          "${TmdbConstants.imageRoot}${controller.cast.profilePath}",
                        ),
                        onForegroundImageError: (exception, stackTrace) {},
                        backgroundImage: const AssetImage(
                          Png.person,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FittedBox(
                            child: Text(
                              controller.cast.name,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w900,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          if (controller.actorDetails!.placeOfBirth != null)
                            AutoScrollText(
                              alignment: Alignment.centerLeft,
                              width: screenWidth * 0.6,
                              text: Text(
                                controller.actorDetails!.placeOfBirth!,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          if (controller.actorDetails!.birthday != null)
                            Text(
                              HelperFunctions.formatDateToDate(
                                  controller.actorDetails!.birthday!),
                              style: const TextStyle(fontSize: 16),
                            ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Biography",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Visibility(
                    visible: controller.actorDetails!.biography != null &&
                        controller.actorDetails!.biography!.isNotEmpty,
                    replacement: const Text(
                      "No biography available",
                      style: TextStyle(fontSize: 16),
                    ),
                    child: ReadMoreText(
                        text: controller.actorDetails!.biography!,
                        isExpanded: false.obs),
                  ),
                ),
                const SizedBox(height: 16),
                Builder(
                  builder: (context) {
                    List<Movie> movies =
                        controller.actorDetails!.movieCredits!.cast!
                            .map(
                              (e) => Movie.fromJson(e.toJson()),
                            )
                            .toList();

                    return MoviesListRow(
                        title: "Movies",
                        movies: movies,
                        height: screenHeight * 0.24,
                        width: screenHeight * 0.16,
                        onTap: () {
                          Get.toNamed(
                            Routes.SEE_ALL_MOVIES,
                            arguments: {
                              "movies_list": movies,
                              "is_movies": true,
                              "title": "${controller.cast.name} Movies",
                            },
                          );
                        });
                  },
                ),
                if (controller.actorDetails!.tvCredits!.cast != null &&
                    controller.actorDetails!.tvCredits!.cast!.isNotEmpty)
                  Builder(
                    builder: (context) {
                      List<Movie> tvShows = controller
                          .actorDetails!.tvCredits!.cast!
                          .map((e) => Movie.fromJson(e.toJson()))
                          .toList();

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 32.0),
                        child: TvShowsListRow(
                            title: "TV Shows",
                            tvShows: tvShows,
                            height: screenHeight * 0.24,
                            width: screenHeight * 0.16,
                            onTap: () {
                              Get.toNamed(
                                Routes.SEE_ALL_MOVIES,
                                arguments: {
                                  "movies_list": tvShows,
                                  "is_movies": false,
                                  "title": "${controller.cast.name} TV Shows",
                                },
                              );
                            }),
                      );
                    },
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
