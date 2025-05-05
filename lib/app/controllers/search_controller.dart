import 'package:cinex/app/models/search/search_results.dart';
import 'package:cinex/app/services/tmdb_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieSearchController extends GetxController {
  final TmdbService tmdbService = TmdbService();
  final TextEditingController searchController = TextEditingController();
  final RxBool isLoading = false.obs;
  final RxBool isError = false.obs;

  final Rx<SearchResults?> searchResults = Rx<SearchResults?>(null);

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  Future<void> searchMovies() async {
    String query = searchController.text.trim();
    if (query.isEmpty) {
      return;
    }
    isLoading.value = true;
    try {
      final response = await tmdbService.searchAll(query);
      searchResults.value = response;
    } catch (e) {
      isError.value = true;
    } finally {
      isLoading.value = false;
    }
  }
}
