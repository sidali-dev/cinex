import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../theme/app_colors.dart';

class PlayingNowShimmer extends StatelessWidget {
  const PlayingNowShimmer({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Shimmer.fromColors(
          baseColor: AppColors.primary(context).withValues(alpha: 0.2),
          highlightColor: AppColors.card(context).withValues(alpha: 0.5),
          period: const Duration(seconds: 2),
          child: Container(
            height: screenHeight * 0.5,
            width: screenWidth,
            decoration: BoxDecoration(
              color: AppColors.card(context),
            ),
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
      ],
    );
  }
}
