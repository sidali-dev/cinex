import 'package:cinex/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../../models/movie/movie.dart';
import '../../../theme/app_colors.dart';
import '../../generals/widgets/movie_card.dart';

class MoviesListRow extends StatelessWidget {
  const MoviesListRow({
    super.key,
    required this.title,
    required this.movies,
    required this.height,
    required this.width,
    required this.onTap,
  });

  final String title;
  final List<Movie> movies;
  final double height;
  final double width;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    int moviesLength = movies.length > 10 ? 10 : movies.length;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0, right: 16.0, left: 16.0),
          child: Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  onTap();
                },
                child: Text(
                  'See more',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary(context),
                  ),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...movies.sublist(0, moviesLength).map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(
                        right: 16.0,
                        left: 16.0,
                      ),
                      child: MovieCard(
                        movie: e,
                        height: height,
                        width: width,
                        onTap: () => Get.toNamed(Routes.MOVIE_DETAILS,
                            arguments: {'movie': e}),
                      ),
                    ),
                  ),
            ],
          ),
        ),
      ],
    );
  }
}
