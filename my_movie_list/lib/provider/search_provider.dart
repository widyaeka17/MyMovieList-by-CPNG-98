import 'dart:async';
import 'package:flutter/material.dart';
import '../data/api/api_service.dart';
import '../data/model/search_model.dart';
import '../utils/result_state.dart';

class MovieSearchProvider extends ChangeNotifier {
  final ApiService apiService;

  MovieSearchProvider({required this.apiService}) {
    fetchSearchRestaurant(query);
  }

  SearchResult? _articlesResult;
  ResultState? _state;
  String _message = '';
  String _query = '';

  String get message => _message;

  String get query => _query;

  SearchResult? get result => _articlesResult;

  ResultState? get state => _state;

  Future<dynamic> fetchSearchRestaurant(String query) async {
    try {
      if (query.isNotEmpty){
        _state = ResultState.loading;
        notifyListeners();
        _query = query;
        final article = await apiService.movieSearch(query);
        if (article.results.isEmpty) {
          _state = ResultState.noData;
          notifyListeners();
          return _message = 'No Result';
        } else {
          _state = ResultState.hasData;
          notifyListeners();
          return _articlesResult = article;
        }
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Something wrong, please check your connection';
    }
  }
}
