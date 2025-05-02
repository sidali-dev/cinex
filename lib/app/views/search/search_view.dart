import 'package:cinex/app/models/cast.dart';
import 'package:cinex/app/models/movie/movie.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';

import 'package:cinex/app/controllers/search_controller.dart';
import 'package:cinex/app/helpers/helper_functions.dart';
import 'package:cinex/app/views/generals/widgets/cast_column.dart';

import 'widgets/search_movie_card.dart';

class SearchView extends GetView<MovieSearchController> {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = HelperFunctions.screenWidth(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              controller: controller.searchController,
              decoration: const InputDecoration(
                labelText: 'Search',
                hintText: 'Search for movies, TV shows, actors...',
                prefixIcon: Icon(Icons.search),
              ),
              onFieldSubmitted: (value) async {
                await controller.searchMovies();
              },
            ),
          ),
          Obx(
            () {
              if (controller.isLoading.value) {
                return _onLoading();
              } else if (controller.isError.value) {
                return _onError();
              } else if (controller.searchResults.value == null) {
                return _onInit();
              } else if (controller.searchResults.value!.totalResults == 0) {
                return _onNoResults();
              } else {
                return _onSuccess(screenWidth);
              }
            },
          )
        ],
      ),
    );
  }

  Widget _onError() {
    return const Expanded(
      child: Center(
        child: Text(
          "Something went wrong!",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }

  Widget _onLoading() {
    return Expanded(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _onSuccess(double screenWidth) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: controller.searchResults.value!.resultsPerson.map(
                    (e) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                        ),
                        child: CastColumn(
                          radius: 40,
                          name: e.name,
                          description: e.gender == 1
                              ? "Female"
                              : e.gender == 2
                                  ? "Male"
                                  : "N/A",
                          id: e.id,
                          image: e.profilePath,
                          cast: Cast.fromJson(e.toJson()),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: Text(
                "Movies",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
              child: Column(
                children: controller.searchResults.value!.resultsMovie
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.only(bottom: 24.0),
                        child: SearchMovieCard(
                          screenWidth: screenWidth,
                          title: e.title,
                          subTitle: e.voteAverage != null
                              ? e.voteAverage!.toStringAsFixed(1)
                              : "N/A",
                          isMovie: true,
                          movie: Movie.fromJson(e.toJson()),
                          imageUrl: e.posterPath,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
              child: Text(
                "Tv Shows",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
              child: Column(
                children: controller.searchResults.value!.resultsTvShow
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.only(bottom: 24.0),
                        child: SearchMovieCard(
                          screenWidth: screenWidth,
                          title: e.name,
                          subTitle: e.voteAverage != null
                              ? e.voteAverage!.toStringAsFixed(1)
                              : "N/A",
                          isMovie: false,
                          movie: Movie.fromJson(e.toJson()),
                          imageUrl: e.posterPath,
                        ),
                      ),
                    )
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _onInit() {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Iconsax.search_normal,
            size: 100,
          ),
          const SizedBox(height: 16),
          Text(
            "Start Searching...",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }

  Widget _onNoResults() {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Iconsax.search_normal,
            size: 100,
          ),
          const SizedBox(height: 16),
          Text(
            "Couldn't find any results",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}
