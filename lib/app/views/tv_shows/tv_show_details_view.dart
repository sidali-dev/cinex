import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../constants/tmdb_constants.dart';
import '../../controllers/tv_shows_controller.dart';
import '../../helpers/helper_functions.dart';
import '../../theme/app_colors.dart';

class TvShowDetailsView extends GetView<TvShowDetailsController> {
  const TvShowDetailsView({super.key});

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
                        controller.tvShow.title!,
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
                // if (!controller.isError.value && !controller.isLoading.value) {
                //   return _onSuccess(context, screenWidth);
                // }
                return SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
