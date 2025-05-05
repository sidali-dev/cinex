import 'package:cinex/app/models/movie/movie.dart';
import 'package:cinex/app/models/movie/movie_details.dart';
import 'package:cinex/app/models/tv_show/tv_show_details.dart';
import 'package:cinex/app/services/bookmarks_service.dart';
import 'package:cinex/app/services/tmdb_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class BookmarksController extends GetxController {
  final BookmarksService _bookmarksService = BookmarksService();
  final TmdbService _tmdbService = TmdbService();

  List _movieBookmarks = [];
  List _tvShowsBookmarks = [];

  final RxList<Movie> movieList = <Movie>[].obs;
  final RxList<Movie> tvShowsList = <Movie>[].obs;

  ///// TabBar

  final RxInt selectedTabIndex = 0.obs;

  final List<Tab> tabs = [
    const Tab(text: 'Movies'),
    const Tab(text: 'TV Shows'),
  ];

  //// View
  final RxBool isLoading = false.obs;
  final RxBool isError = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadMovies();
  }

  Future loadMovies() async {
    isLoading.value = true;
    _fetchBookmarks();

    movieList.clear();
    tvShowsList.clear();

    try {
      for (int id in _movieBookmarks) {
        Movie movie = await _getMovieDetails(id, true);
        movieList.add(movie);
      }
      for (int id in _tvShowsBookmarks) {
        Movie movie = await _getMovieDetails(id, false);
        tvShowsList.add(movie);
      }
    } catch (e) {
      isError.value = true;
    } finally {
      isLoading.value = false;
    }
  }

  Future<Movie> _getMovieDetails(int id, bool isMovie) async {
    Movie? movie;
    if (isMovie) {
      final MovieDetails movieDetails = await _tmdbService.getMovieDetails(id);
      movie = Movie.fromJson(movieDetails.toJson());
    } else {
      final TvShowDetails tvShowDetails =
          await _tmdbService.getTvShowDetails(id);
      movie = Movie.fromJson(tvShowDetails.toJson());
    }
    return movie;
  }

  void _fetchBookmarks() {
    _movieBookmarks = _bookmarksService.getBookmarks(true);
    _tvShowsBookmarks = _bookmarksService.getBookmarks(false);
  }

  void addBookmark(int id, bool isMovie) async {
    Movie movie = await _getMovieDetails(id, isMovie);

    final List response = _bookmarksService.addBookmark(id, isMovie);

    if (isMovie) {
      _movieBookmarks = response;
      movieList.add(movie);
    } else {
      _tvShowsBookmarks = response;
      tvShowsList.add(movie);
    }
  }

  void removeBookmark(int id, bool isMovie) {
    _bookmarksService.removeBookmark(id, isMovie);
    _fetchBookmarks();

    if (isMovie) {
      movieList.removeWhere((movie) => movie.id == id);
    } else {
      tvShowsList.removeWhere((movie) => movie.id == id);
    }
  }

  bool isBookmarked(int id, bool isMovie) {
    if (isMovie) {
      return _movieBookmarks.contains(id);
    } else {
      return _tvShowsBookmarks.contains(id);
    }
  }

  changeIndex(int index) {
    selectedTabIndex.value = index;
  }
}
