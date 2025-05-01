import 'package:flutter/material.dart';

import '../../generals/widgets/movie_card_shimmer.dart';

class MoviesListRowShimmer extends StatelessWidget {
  const MoviesListRowShimmer({
    super.key,
    required this.title,
    required this.height,
    required this.width,
  });

  final String title;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0, right: 16.0, left: 16.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                5,
                (index) => Padding(
                  padding: const EdgeInsets.only(
                    right: 16.0,
                    left: 16.0,
                  ),
                  child: MovieCardShimmer(
                    height: height,
                    width: width,
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
