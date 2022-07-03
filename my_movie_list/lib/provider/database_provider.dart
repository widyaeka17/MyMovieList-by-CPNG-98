import 'package:flutter/foundation.dart';

import '../data/db/database_helper.dart';
import '../data/model/movie_list_model.dart';
import '../utils/result_state.dart';

class DatabaseProvider extends ChangeNotifier {
  final DatabaseHelper databaseHelper;

  DatabaseProvider({required this.databaseHelper}) {
    _getWatchlist();
  }

  ResultState? _state;
  ResultState? get state => _state;

  String _message = '';
  String get message => _message;

  List<MovieItem> _watchlist = [];
  List<MovieItem> get watchlist => _watchlist;

  void _getWatchlist() async {
    _watchlist = await databaseHelper.getWatchlists();
    if (_watchlist.isNotEmpty) {
      _state = ResultState.hasData;
    } else {
      _state = ResultState.noData;
      _message = 'No Watchlist Yet';
    }
    notifyListeners();
  }

  void addWatchlist(MovieItem article) async {
    try {
      await databaseHelper.insertWatchlist(article);
      _getWatchlist();
    } catch (e) {
      _state = ResultState.error;
      _message = 'Error: $e';
      notifyListeners();
    }
  }

  Future<bool> isWatchlisted(String id) async {
    final bookmarkedMovieItem = await databaseHelper.getWatchlistById(id);
    return bookmarkedMovieItem.isNotEmpty;
  }

  void removeWatchlist(String url) async {
    try {
      await databaseHelper.removeWatchlist(url);
      _getWatchlist();
    } catch (e) {
      _state = ResultState.error;
      _message = 'Error: $e';
      notifyListeners();
    }
  }
}