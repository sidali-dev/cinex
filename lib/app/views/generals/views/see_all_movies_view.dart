import 'package:cinex/app/routes/app_pages.dart';
import 'package:cinex/app/views/generals/widgets/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../../helpers/helper_functions.dart';
import '../../../models/movie/movie.dart';

class SeeAllMoviesView extends StatelessWidget {
  final List<Movie> movies;
  final String title;
  final bool isMovies;

  const SeeAllMoviesView({
    required this.movies,
    required this.title,
    required this.isMovies,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = HelperFunctions.screenHeight(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 16),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32.0,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.all(16),
                itemCount: movies.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.45,
                    crossAxisCount: 3,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16),
                itemBuilder: (context, index) => MovieCard(
                  movie: movies[index],
                  height: screenHeight * 0.24,
                  width: screenHeight * 0.16,
                  onTap: () {
                    if (isMovies) {
                      Get.toNamed(Routes.MOVIE_DETAILS,
                          arguments: {'movie': movies[index]});
                    } else {
                      Get.toNamed(Routes.TV_SHOW_DETAILS,
                          arguments: {'tv_show': movies[index]});
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
