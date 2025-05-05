// ignore_for_file: constant_identifier_names

import 'package:cinex/app/controllers/actor_profile_controller.dart';
import 'package:cinex/app/controllers/bookmarks_controller.dart';
import 'package:cinex/app/controllers/home_movies_controller.dart';
import 'package:cinex/app/controllers/home_tv_shows_controller.dart';
import 'package:cinex/app/controllers/navigation_controller.dart';
import 'package:cinex/app/controllers/search_controller.dart';
import 'package:cinex/app/controllers/tv_show_details_controller.dart';
import 'package:cinex/app/models/cast.dart';
import 'package:cinex/app/views/actor_profile/actor_profile_view.dart';
import 'package:cinex/app/views/generals/views/see_all_cast_view.dart';
import 'package:cinex/app/views/generals/views/see_all_movies_view.dart';
import 'package:cinex/app/views/movie_details/movie_details_view.dart';
import 'package:cinex/app/views/splash/splash_view.dart';
import 'package:cinex/app/views/tv_shows_details/tv_show_details_view.dart';
import 'package:cinex/bottom_navigation.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../controllers/movie_details_controller.dart';
import '../models/movie/movie.dart';
import '../views/home/home_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.BOTTOM_NAVIGATION;

  static final List<GetPage> routes = [
    GetPage(name: Routes.SPLASH, page: () => SplashView()),
    GetPage(
      name: Routes.BOTTOM_NAVIGATION,
      page: () => const BottomNavigation(),
      bindings: [
        BindingsBuilder(
          () {
            Get.put(NavigationController());
            Get.put(HomeController());
            Get.put(MovieSearchController());
            Get.put(HomeMoviesController());
            Get.put(BookmarksController());
            Get.put(HomeTvShowsController());
          },
        ),
      ],
    ),
    GetPage(name: Routes.HOME, page: () => HomeView(), bindings: [
      BindingsBuilder(
        () {},
      )
    ]),
    GetPage(
      name: Routes.MOVIE_DETAILS,
      transition: Transition.downToUp,
      page: () => MovieDetailsView(),
      bindings: [
        BindingsBuilder(() {
          final movie = Get.arguments['movie'] as Movie;
          final tag = movie.id.toString();

          Get.put<MovieDetailsController>(
            MovieDetailsController(movie: movie),
            tag: tag,
          );
        }),
      ],
      preventDuplicates: false,
    ),
    GetPage(
      name: Routes.TV_SHOW_DETAILS,
      page: () => TvShowDetailsView(),
      transition: Transition.downToUp,
      bindings: [
        BindingsBuilder(() {
          final movie = Get.arguments['tv_show'] as Movie;
          final tag = movie.id.toString();

          Get.put<TvShowDetailsController>(
            TvShowDetailsController(tvShow: movie),
            tag: tag,
          );
        }),
      ],
      preventDuplicates: false,
    ),
    GetPage(
      name: Routes.SEE_ALL_CAST,
      transition: Transition.downToUp,
      page: () {
        final args = Get.arguments;
        return SeeAllCreditsView(
          list: args["cast_list"],
          movieName: args["movie_name"],
          isCast: args["is_cast"],
        );
      },
    ),
    GetPage(
        name: Routes.SEE_ALL_MOVIES,
        transition: Transition.downToUp,
        page: () {
          final args = Get.arguments;
          return SeeAllMoviesView(
            movies: args["movies_list"],
            title: args["title"],
            isMovies: args["is_movies"],
          );
        }),
    GetPage(
      name: Routes.ACTOR_PROFILE,
      transition: Transition.downToUp,
      page: () => ActorProfileView(),
      bindings: [
        BindingsBuilder(
          () {
            final args = Get.arguments;
            Cast cast = args['cast'];
            Get.put(ActorProfileController(cast: cast),
                tag: cast.id.toString());
          },
        ),
      ],
      preventDuplicates: false,
    ),
  ];
}
