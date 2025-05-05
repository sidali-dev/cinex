import 'package:cinex/app/constants/tmdb_constants.dart';
import 'package:cinex/app/helpers/helper_functions.dart';
import 'package:cinex/app/routes/app_pages.dart';
import 'package:cinex/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../models/movie/movie.dart';

class BookmarkCard extends StatelessWidget {
  final Movie movie;
  final double width;
  final double height;
  final Function(int id) onTap;

  const BookmarkCard({
    super.key,
    required this.movie,
    required this.width,
    required this.height,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GestureDetector(
        onTap: () {
          if (1 == 1) {
            Navigator.pushNamed(
              context,
              Routes.MOVIE_DETAILS,
              arguments: {"movie": movie},
            );
          } else {
            Navigator.pushNamed(
              context,
              Routes.TV_SHOW_DETAILS,
              arguments: {"tv_show": movie},
            );
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Movie Poster
                    Image.network(
                      "${TmdbConstants.imageRoot}${movie.posterPath}",
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[800],
                          child: const Center(
                            child: Icon(
                              Icons.movie,
                              color: Colors.white54,
                              size: 40,
                            ),
                          ),
                        );
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          color: Colors.grey[900],
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      },
                    ),

                    // Gradient Overlay
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
                                  .withValues(alpha: 0.8),
                            ],
                            stops: const [0.6, 0.75, 1.0],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8.0),
                  Text(
                    movie.title ?? movie.name ?? "",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    HelperFunctions.formatDateToDate(
                        movie.releaseDate ?? movie.firstAirDate!),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            SizedBox(width: 16),
            GestureDetector(
              child: Icon(
                Icons.bookmark,
                color: AppColors.primary(context),
              ),
              onTap: () {
                onTap(movie.id);
              },
            ),
            SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
