import 'dart:async';
import 'package:flutter/material.dart';
import '../data/api/api_service.dart';
import '../data/model/movie_list_model.dart';
import '../utils/result_state.dart';

class UpcomingProvider extends ChangeNotifier {
  final ApiService apiService;

  UpcomingProvider({required this.apiService}) {
    _fetchAllArticle();
  }

  late MovieResult _articlesResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  MovieResult get result => _articlesResult;

  ResultState get state => _state;

  Future<dynamic> _fetchAllArticle() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final article = await apiService.upcomingList();
      if (article.items.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'No Upcoming Movie Yet';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _articlesResult = article;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Something wrong, please check your connection';
    }
  }
}
