import 'package:cinex/app/constants/tmdb_constants.dart';
import 'package:cinex/app/controllers/movie_details_controller.dart';
import 'package:cinex/app/helpers/helper_functions.dart';
import 'package:cinex/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../models/movie/movie.dart';
import '../../theme/app_colors.dart';
import '../generals/widgets/cast_column.dart';

class MovieDetailsView extends GetView<MovieDetailsController> {
  const MovieDetailsView({super.key});

  //to help the view decide which controller to use
  @override
  String? get tag => (Get.arguments['movie'] as Movie).id.toString();

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
                    "${TmdbConstants.imageRoot}${controller.movie.posterPath}",
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
                        controller.movie.title!,
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
    final int castLength = controller.movieDetails!.credits!.cast!.length > 5
        ? 5
        : controller.movieDetails!.credits!.cast!.length;
    final int crewLength = controller.movieDetails!.credits!.crew!.length > 5
        ? 5
        : controller.movieDetails!.credits!.crew!.length;

    return Column(
      children: [
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MovieSpecialInfo(
              text: HelperFunctions.formatDateToYear(
                  controller.movie.releaseDate!),
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
              text: "${controller.movieDetails!.runtime} min",
              icon: Iconsax.clock,
            ),
            SizedBox(
              width: 24,
              height: 16,
              child: VerticalDivider(
                color: AppColors.textPrimary(context),
              ),
            ),
            MovieSpecialInfo(
              text: controller.movieDetails!.genres!.first.name,
              icon: Iconsax.video,
            ),
          ],
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: ElevatedButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                ),
                SizedBox(width: 8),
                Text(
                  'Watch Trailer',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        Visibility(
          visible: controller.movie.overview != null,
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
                  controller.movie.overview!,
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.start,
                ),
              ),
              if (controller.movieDetails!.credits != null)
                Visibility(
                  visible: controller.movieDetails!.credits!.cast != null,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: [
                            Text(
                              "Cast",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.SEE_ALL_CAST, arguments: {
                                  "cast_list":
                                      controller.movieDetails!.credits!.cast,
                                  "movie_name": controller.movie.title,
                                  "is_cast": true,
                                });
                              },
                              child: Text(
                                "See All",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.primary(context)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Row(
                            children: controller.movieDetails!.credits!.cast!
                                .sublist(0, castLength)
                                .map(
                                  (cast) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: CastColumn(
                                      image: cast.profilePath,
                                      name: cast.name,
                                      description: cast.character,
                                      id: cast.id,
                                      cast: cast,
                                      radius: screenWidth * 0.12,
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              if (controller.movieDetails!.credits != null)
                Visibility(
                  visible: controller.movieDetails!.credits!.crew != null,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: [
                            Text(
                              "Crew",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.SEE_ALL_CAST, arguments: {
                                  "cast_list":
                                      controller.movieDetails!.credits!.crew,
                                  "movie_name": controller.movie.title,
                                  "is_cast": false,
                                });
                              },
                              child: Text(
                                "See All",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.primary(context)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Row(
                            children: controller.movieDetails!.credits!.crew!
                                .sublist(0, crewLength)
                                .map(
                                  (crew) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: CastColumn(
                                      image: crew.profilePath,
                                      id: crew.id,
                                      name: crew.name,
                                      description: crew.job,
                                      radius: screenWidth * 0.12,
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
            ],
          ),
        ),
      ],
    );
  }
}

class MovieSpecialInfo extends StatelessWidget {
  const MovieSpecialInfo({
    super.key,
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon),
        const SizedBox(width: 8),
        Text(
          text,
        ),
      ],
    );
  }
}
