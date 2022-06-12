import 'dart:async';
import 'package:flutter/material.dart';
import '../data/api/api_service.dart';
import '../data/model/detail_model.dart';
import '../utils/result_state.dart';

class DetailProvider extends ChangeNotifier {
  final ApiService apiService;
  final String id;

  DetailProvider({required this.apiService, required this.id}) {
    _fetchAllArticle();
  }

  late DetailResult _articlesResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  DetailResult get result => _articlesResult;

  ResultState get state => _state;

  Future<dynamic> _fetchAllArticle() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final article = await apiService.movieDetail(id);
      if (article.id.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _articlesResult = article;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Something wrong, please check your connection $e';
    }
  }
}
