import 'package:cinex/app/controllers/trailer_controller.dart';
import 'package:cinex/app/helpers/helper_functions.dart';
import 'package:cinex/app/theme/app_colors.dart';
import 'package:cinex/app/views/generals/widgets/error_placeholder.dart';
import 'package:cinex/app/views/generals/widgets/loading_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class TrailerView extends GetView<TrailerController> {
  const TrailerView({super.key});

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerScaffold(
      fullscreenOrientations: const [
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ],
      // Lock to portrait when NOT in fullscreen
      lockedOrientations: const [
        DeviceOrientation.portraitUp,
      ],
      // Set the default orientation (This might be unnecessary).
      defaultOrientations: const [
        DeviceOrientation.portraitUp,
      ],
      // Optional: Auto-enter fullscreen on device rotation
      autoFullScreen: true,
      controller: controller.youtubeController,
      builder: (context, player) {
        return Obx(
          () {
            if (controller.isLoading.value) {
              return Scaffold(
                body: Center(
                  child: LoadingPlaceHolder(title: "LOADING TRAILER..."),
                ),
              );
            }
            if (controller.isError.value) {
              return Scaffold(
                body: Center(
                  child: ErrorPlaceHolder(title: "ERROR LOADING TRAILER"),
                ),
              );
            }
            return Scaffold(
              appBar: AppBar(
                title: const Text('Watch Trailer'),
                centerTitle: true,
              ),
              body: Column(
                children: [
                  Material(
                      elevation: 24,
                      shadowColor: AppColors.primary(context),
                      child: player),
                  SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      controller.movie.title!,
                      style: TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.w800),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Iconsax.book_1),
                      SizedBox(width: 8.0),
                      Text(
                        "Overview",
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      controller.movie.overview!,
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 24.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Iconsax.information),
                      SizedBox(width: 8.0),
                      Text(
                        "Info",
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  if (controller.movieDetails!.releaseDate != null) ...[
                    SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Realease Date:  ",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          HelperFunctions.formatDateToDate(
                              controller.movieDetails!.releaseDate!),
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w600),
                        ),
                      ],
                    )
                  ],
                  if (controller.movieDetails!.runtime != null) ...[
                    SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Duration:  ",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "${controller.movieDetails!.runtime} min",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w600),
                        ),
                      ],
                    )
                  ],
                  if (controller.movieDetails!.genres!.isNotEmpty) ...[
                    SizedBox(height: 8.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Wrap(
                        spacing: 8.0,
                        children: controller.movieDetails!.genres!
                            .map(
                              (genre) => Chip(
                                label: Text(genre.name),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ],
              ),
            );
          },
        );
      },
    );
  }
}
