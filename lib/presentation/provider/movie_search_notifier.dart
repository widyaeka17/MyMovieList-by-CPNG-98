import 'package:flutter/material.dart';
import 'package:mymovielist/common/state_enum.dart';
import 'package:mymovielist/data/datasource/movie_api.dart';
import 'package:mymovielist/data/models/movie_search_model.dart';

class MovieSearchNotifier extends ChangeNotifier {
  final ApiService apiService = ApiService();
  late MovieSearchModel _searchMovieResult;
  MovieSearchModel get searchMovieResult => _searchMovieResult;

  RequestState _state = RequestState.noData;
  RequestState get state => _state;

  Future<dynamic> fetchMovieSearch(String query) async {
    try {
      _state = RequestState.loading;
      notifyListeners();
      final result = await apiService.searchMovies(query);
      print(result);
      if (result.results.isEmpty) {
        _state = RequestState.noData;
        notifyListeners();
      } else {
        _searchMovieResult = result;
        _state = RequestState.hasData;
        print(_searchMovieResult);
        notifyListeners();
      }
    } catch (e) {
      _state = RequestState.error;
      notifyListeners();
    }
  }
}
