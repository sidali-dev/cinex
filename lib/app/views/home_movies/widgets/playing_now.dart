import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinex/app/constants/tmdb_constants.dart';
import 'package:cinex/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../../models/movie/movie.dart';
import '../../../theme/app_colors.dart';

class PlayingNow extends StatelessWidget {
  const PlayingNow({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.playingNow,
    required this.isMovies,
  });

  final double screenHeight;
  final double screenWidth;
  final List<Movie> playingNow;
  final bool isMovies;

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    return Stack(
      children: [
        Container(
          height: screenHeight * 0.5,
          width: screenWidth,
          decoration: BoxDecoration(
            color: AppColors.primary(context),
          ),
          child: CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              enableInfiniteScroll: true,
              height: screenHeight * 0.5,
              autoPlayAnimationDuration: const Duration(seconds: 1),
              autoPlayInterval: const Duration(seconds: 5),
              onPageChanged: (index, reason) => currentIndex = index,
            ),
            items: playingNow
                .map(
                  (movie) => SizedBox(
                    width: screenWidth,
                    child: Image.network(
                      "${TmdbConstants.imageRoot}${movie.posterPath!}",
                      fit: BoxFit.cover,
                      width: screenWidth,
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
                )
                .toList(),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () {
                    if (isMovies) {
                      Get.toNamed(Routes.MOVIE_DETAILS,
                          arguments: {'movie': playingNow[currentIndex]});
                    } else {
                      Get.toNamed(Routes.TV_SHOW_DETAILS,
                          arguments: {'tv_show': playingNow[currentIndex]});
                    }
                  },
                  child: Icon(Icons.info_outline)),
              SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8),
                    Text('Watch Trailer'),
                  ],
                ),
              ),
              SizedBox(width: 16),
              Icon(Icons.bookmark_border_rounded),
            ],
          ),
        ),
      ],
    );
  }
}
