
import 'package:capstone/ApiData/restaurant_list.dart';
import 'package:flutter/foundation.dart';

enum ResultState { Loading, NoData, HasData, Error }

class ListProvider extends ChangeNotifier {
  final ApiService apiService = ApiService();

  late FilmList _Popular;
  late FilmList _CommingSoon;
  late FilmList _Teater;
  late ResultState _state;
  late String _message;

  FilmList get listdataPopular => _Popular;
  FilmList get listdataCommingSoon => _CommingSoon;
  FilmList get listDataTeater => _Teater;
  ResultState get state => _state;
  String get message => _message;

  ListProvider getHomeData() {
    getCommingSoon();
    getPopular();
    getTeater();
    return this;
  }

  Future<dynamic> getPopular() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      var response;
      response = await apiService.listDataPopular();
      if (response.items.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Not Get Data';
      }else {
        print("ada data");
        _state = ResultState.HasData;
        notifyListeners();
        return _Popular = response;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = "Gagal Mendapatkan Data";
    }
  }

  Future<dynamic> getCommingSoon() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      var response;
      response = await apiService.listDataComingSoon();
      if (response.items.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Not Get Data';
      }else {
        print("ada data");
        _state = ResultState.HasData;
        notifyListeners();
        return _CommingSoon = response;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = "Gagal Mendapatkan Data";
    }
  }

  Future<dynamic> getTeater() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      var response;
      response = await apiService.listDataTeater();
      if (response.items.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Not Get Data';
      }else {
        print("ada data");
        _state = ResultState.HasData;
        notifyListeners();
        return _Teater = response;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = "Gagal Mendapatkan Data";
    }
  }
}