import 'package:cinex/app/constants/tmdb_constants.dart';
import 'package:flutter/material.dart';

import '../../../models/movie/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final double width;
  final double height;
  final VoidCallback onTap;

  const MovieCard({
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
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
            const SizedBox(height: 8),
            SizedBox(
              width: width,
              child: Text(
                movie.title ?? "",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
