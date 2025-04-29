import 'package:cinex/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MovieCardShimmer extends StatelessWidget {
  final double width;
  final double height;

  const MovieCardShimmer({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Shimmer.fromColors(
          baseColor: AppColors.primary(context).withValues(alpha: 0.2),
          highlightColor: AppColors.card(context).withValues(alpha: 0.5),
          period: const Duration(seconds: 2),
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: AppColors.card(context),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Shimmer.fromColors(
          baseColor: AppColors.primary(context).withValues(alpha: 0.2),
          highlightColor: AppColors.card(context).withValues(alpha: 0.5),
          period: const Duration(seconds: 2),
          child: Container(
            width: width,
            height: 24,
            decoration: BoxDecoration(
              color: AppColors.card(context),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        )
      ],
    );
  }
}
