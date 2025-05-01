class TvShowsHelperFunctions {
  static String getPosterUrl(List<String?> posterPaths) {
    for (String? path in posterPaths) {
      if (path != null && path.isNotEmpty) {
        return 'https://image.tmdb.org/t/p/w500$path';
      }
    }
    return "";
  }
}
