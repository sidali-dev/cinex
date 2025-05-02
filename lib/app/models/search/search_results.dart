import 'package:cinex/app/models/search/search_results_movie.dart';
import 'package:cinex/app/models/search/search_results_person.dart';
import 'package:cinex/app/models/search/search_results_tv_show.dart';

class SearchResults {
  final int page;
  final int totalPages;
  final int totalResults;
  final List<SearchResultsMovie> resultsMovie;
  final List<SearchResultsTvShow> resultsTvShow;
  final List<SearchResultsPerson> resultsPerson;

  SearchResults({
    required this.page,
    required this.totalPages,
    required this.totalResults,
    required this.resultsMovie,
    required this.resultsTvShow,
    required this.resultsPerson,
  });

  factory SearchResults.fromJson(Map<String, dynamic> map) {
    List<Map> movies = [];
    List<Map> tvShows = [];
    List<Map> people = [];

    for (Map results in map['results']) {
      switch (results['media_type']) {
        case 'movie':
          movies.add(results);
          break;
        case 'tv':
          tvShows.add(results);
          break;
        case 'person':
          if (results['known_for_department'] == 'Acting') {
            people.add(results);
          }
          break;
      }
    }

    return SearchResults(
      page: map['page'] as int,
      totalPages: map['total_pages'] as int,
      totalResults: map['total_results'] as int,
      resultsMovie: List<SearchResultsMovie>.from(
        movies.map<SearchResultsMovie?>(
          (x) => SearchResultsMovie.fromJson(x as Map<String, dynamic>),
        ),
      ),
      resultsTvShow: List<SearchResultsTvShow>.from(
        tvShows.map<SearchResultsTvShow?>(
          (x) => SearchResultsTvShow.fromJson(x as Map<String, dynamic>),
        ),
      ),
      resultsPerson: List<SearchResultsPerson>.from(
        people.map<SearchResultsPerson?>(
          (x) => SearchResultsPerson.fromJson(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
