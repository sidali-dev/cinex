import 'package:get_storage/get_storage.dart';

class BookmarksService {
  // Singleton instance
  static final BookmarksService _instance = BookmarksService._internal();

  final String _movieBookmarksKey = 'movie_bookmarks_key';
  final String _tvShowsBookmarksKey = 'tv_shows_bookmarks_key';

  List _movieBookmarks = [];
  List _tvShowsBookmarks = [];

  GetStorage get _storage => GetStorage();

  // Private constructor
  BookmarksService._internal();

  // Factory constructor to return the singleton instance
  factory BookmarksService() {
    return _instance;
  }

  // Method to get bookmarks
  List getBookmarks(bool isMovie) {
    if (isMovie) {
      _movieBookmarks =
          _storage.read<List>(_movieBookmarksKey) ?? _movieBookmarks;
      return _movieBookmarks;
    } else {
      _tvShowsBookmarks =
          _storage.read<List>(_tvShowsBookmarksKey) ?? _tvShowsBookmarks;
      return _tvShowsBookmarks;
    }
  }

  // Method to add a bookmark
  List addBookmark(int id, bool isMovie) {
    if (isMovie) {
      _movieBookmarks.add(id);
      _storage.write(_movieBookmarksKey, _movieBookmarks);
      return _movieBookmarks;
    } else {
      _tvShowsBookmarks.add(id);
      _storage.write(_tvShowsBookmarksKey, _tvShowsBookmarks);
      return _tvShowsBookmarks;
    }
  }

  // Method to remove a bookmark
  void removeBookmark(int id, bool isMovie) {
    if (isMovie) {
      _movieBookmarks.remove(id);
      _storage.write(_movieBookmarksKey, _movieBookmarks);
    } else {
      _tvShowsBookmarks.remove(id);
      _storage.write(_tvShowsBookmarksKey, _tvShowsBookmarks);
    }
  }
}
