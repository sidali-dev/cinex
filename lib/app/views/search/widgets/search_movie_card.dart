import 'package:cinex/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../../constants/tmdb_constants.dart';
import '../../../models/movie/movie.dart';

class SearchMovieCard extends StatelessWidget {
  const SearchMovieCard({
    required this.screenWidth,
    required this.title,
    required this.subTitle,
    required this.isMovie,
    required this.movie,
    this.imageUrl,
    super.key,
  });

  final double screenWidth;
  final String title;
  final String subTitle;
  final bool isMovie;
  final Movie movie;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            if (isMovie) {
              Get.toNamed(Routes.MOVIE_DETAILS, arguments: {'movie': movie});
            } else {
              Get.toNamed(Routes.TV_SHOW_DETAILS,
                  arguments: {'tv_show': movie});
            }
          },
          child: Material(
            elevation: 6,
            borderRadius: BorderRadius.circular(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                "${TmdbConstants.imageRoot}$imageUrl",
                height: screenWidth * 0.22,
                width: screenWidth * 0.4,
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[800],
                    height: screenWidth * 0.24,
                    width: screenWidth * 0.4,
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
            ),
          ),
        ),
        SizedBox(width: 16.0),
        SizedBox(
          width: screenWidth * 0.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "vote avg: $subTitle",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        )
      ],
    );
  }
}
