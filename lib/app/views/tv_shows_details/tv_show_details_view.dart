import 'package:cinex/app/models/tv_show/season.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';

import '../../constants/tmdb_constants.dart';
import '../../controllers/tv_show_details_controller.dart';
import '../../helpers/helper_functions.dart';
import '../../models/movie/movie.dart';
import '../../theme/app_colors.dart';
import '../movie_details/movie_details_view.dart';
import 'widgets/tv_show_episode_card.dart';

class TvShowDetailsView extends GetView<TvShowDetailsController> {
  const TvShowDetailsView({super.key});

  //to help the view decide which controller to use
  @override
  String? get tag => (Get.arguments['tv_show'] as Movie).id.toString();

  @override
  Widget build(BuildContext context) {
    final screenHeight = HelperFunctions.screenHeight(context);
    final screenWidth = HelperFunctions.screenWidth(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: AppColors.primary(context),
                  child: Image.network(
                    "${TmdbConstants.imageRoot}${controller.tvShow.posterPath}",
                    fit: BoxFit.contain,
                    width: screenWidth,
                    height: screenHeight * 0.5,
                    alignment: Alignment.center,
                    errorBuilder: (context, error, stackTrace) {
                      return SizedBox(
                        width: screenWidth,
                        height: screenHeight * 0.5,
                        child: const Center(
                          child: Icon(
                            Icons.movie,
                            color: Colors.white54,
                            size: 80,
                          ),
                        ),
                      );
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return SizedBox(
                        width: screenWidth,
                        height: screenHeight * 0.5,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: AppColors.background(context),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Theme.of(context)
                              .scaffoldBackgroundColor
                              .withValues(alpha: 0.2),
                          Theme.of(context)
                              .scaffoldBackgroundColor
                              .withValues(alpha: 0.4),
                          Theme.of(context)
                              .scaffoldBackgroundColor
                              .withValues(alpha: 0.6),
                          Theme.of(context)
                              .scaffoldBackgroundColor
                              .withValues(alpha: 0.8),
                          Theme.of(context)
                              .scaffoldBackgroundColor
                              .withValues(alpha: 1.0),
                        ],
                        stops: const [
                          0.4,
                          0.5,
                          0.6,
                          0.7,
                          0.8,
                          1.0,
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Text(
                        controller.tvShow.name!,
                        style: TextStyle(
                          color: AppColors.textPrimary(context),
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Obx(
              () {
                if (controller.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (controller.isError.value) {
                  return const Center(
                    child: Text('Error'),
                  );
                }
                if (!controller.isError.value && !controller.isLoading.value) {
                  return _onSuccess(context, screenWidth);
                }
                return SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _onSuccess(BuildContext context, double screenWidth) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MovieSpecialInfo(
              text: HelperFunctions.formatDateToYear(
                  controller.tvShowDetails!.firstAirDate!),
              icon: Iconsax.calendar_2,
            ),
            SizedBox(
              width: 24,
              height: 16,
              child: VerticalDivider(
                color: AppColors.textPrimary(context),
              ),
            ),
            MovieSpecialInfo(
                text: "${controller.tvShowDetails!.numberOfSeasons} Seasons",
                icon: Iconsax.video_play),
            SizedBox(
              width: 24,
              height: 16,
              child: VerticalDivider(
                color: AppColors.textPrimary(context),
              ),
            ),
            MovieSpecialInfo(
              text: "${controller.tvShowDetails!.type}",
              icon: Iconsax.video,
            ),
          ],
        ),
        // const SizedBox(height: 16),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 32.0),
        //   child: ElevatedButton(
        //     onPressed: () {},
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Icon(
        //           Icons.play_arrow,
        //           color: Colors.white,
        //         ),
        //         SizedBox(width: 8),
        //         Text(
        //           'Watch Trailer',
        //           style: TextStyle(
        //             fontWeight: FontWeight.bold,
        //             fontSize: 20,
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        const SizedBox(height: 24),
        Visibility(
          visible: controller.tvShow.overview != null,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Overview',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  controller.tvShow.overview!,
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Obx(
                  () => DropdownButtonFormField<Season>(
                    value: controller.selectedSeason.value,
                    elevation: 0,
                    items: [
                      for (var season in controller.tvShowDetails!.seasons!)
                        DropdownMenuItem<Season>(
                          value: season,
                          child: Text(season.name!),
                        )
                    ],
                    decoration: InputDecoration(
                      labelText: 'Select Season',
                      prefixIcon: Icon(Iconsax.video),
                      fillColor: AppColors.background(context),
                    ),
                    onChanged: (value) {
                      if (value != null) {
                        controller.changeSelectedSeason(value);
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                width: screenWidth,
                height: 200,
                child: Obx(
                  () {
                    if (controller.isSeasonLoading.value) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (controller.isSeasonError.value) {
                      return const Center(
                        child: Text('Error'),
                      );
                    }

                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: TvShowEpisodeCard(
                                width: 190,
                                episode: controller.selectedSeasonDetails.value!
                                    .episodes[index],
                                posterPaths: [
                                  controller.selectedSeasonDetails.value!
                                      .episodes[index].stillPath,
                                  controller
                                      .selectedSeasonDetails.value!.posterPath,
                                  controller.tvShow.posterPath,
                                ],
                              ),
                            ),
                        itemCount: controller
                            .selectedSeasonDetails.value!.episodes.length);
                  },
                ),
              ),
              SizedBox(height: 32),
            ],
          ),
        ),
      ],
    );
  }
}
