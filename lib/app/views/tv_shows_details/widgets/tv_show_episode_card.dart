import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';

import '../../../helpers/helper_functions.dart';
import '../../../helpers/tv_shows_helper_functions.dart';
import '../../../models/tv_show/tv_show_episode.dart';
import '../../../theme/app_colors.dart';
import '../../movie_details/movie_details_view.dart';

class TvShowEpisodeCard extends StatelessWidget {
  const TvShowEpisodeCard({
    super.key,
    required this.width,
    required this.posterPaths,
    required this.episode,
  });

  final int width;
  final List<String?> posterPaths;
  final TvShowEpisode episode;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.toDouble(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: GestureDetector(
              onTap: () {
                _episodeBottomSheet(context, episode);
              },
              child: Container(
                width: width.toDouble(),
                height: width * 0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Image.network(
                  TvShowsHelperFunctions.getPosterUrl(posterPaths),
                  fit: BoxFit.fill,
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
              ),
            ),
          ),
          Text(episode.name!,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.start),
          Text(episode.runtime != null ? "${episode.runtime!} min" : "unknown",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.start),
        ],
      ),
    );
  }

  Future<dynamic> _episodeBottomSheet(
      BuildContext context, TvShowEpisode episode) {
    return Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          color: AppColors.card(context),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0, left: 16.0, top: 8.0),
              child: Text(
                episode.name!,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              episode.seasonNumber == null
                  ? "unknown"
                  : "Season ${episode.seasonNumber} Episode ${episode.episodeNumber}",
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MovieSpecialInfo(
                  text: episode.airDate != null
                      ? HelperFunctions.formatDateToYear(episode.airDate!)
                      : "unknown",
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
                    text: episode.runtime != null
                        ? "${episode.runtime} min"
                        : "unknown",
                    icon: Iconsax.clock),
              ],
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("Overview",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                episode.overview != null && episode.overview != ""
                    ? episode.overview!
                    : "No overview available",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
