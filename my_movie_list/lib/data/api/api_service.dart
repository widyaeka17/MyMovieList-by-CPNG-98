import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/detail_model.dart';
import '../model/movie_list_model.dart';
import '../model/search_model.dart';
class ApiService {
  static const String _baseUrl    = 'https://imdb-api.com/en/API/';
  static const String _upcoming   = 'ComingSoon/';
  static const String _popular    = 'MostPopularMovies/';
  static const String _inTheaters = 'InTheaters/';
  static const String _detail     = 'Title/';
  static const String _search     = 'SearchMovie/';
  static const String _apiKey     = 'k_s4byfamm'; // API Key: k_574u1868, k_mvy4crq0, k_s4byfamm

  Future<MovieResult> upcomingList() async {
    final response = await http.get(Uri.parse(_baseUrl+_upcoming+_apiKey));
    if (response.statusCode == 200) {
      return MovieResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<MovieResult> popularList() async {
    final response = await http.get(Uri.parse(_baseUrl+_popular+_apiKey));
    if (response.statusCode == 200) {
      return MovieResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<MovieResult> inTheatersList() async {
    final response = await http.get(Uri.parse(_baseUrl+_inTheaters+_apiKey));
    if (response.statusCode == 200) {
      return MovieResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<DetailResult> movieDetail(String id) async {
    final response = await http.get(Uri.parse(_baseUrl+_detail+_apiKey+'/'+id+'/Posters,'));
    if (response.statusCode == 200) {
      return DetailResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<SearchResult> movieSearch(String search) async {
    final response = await http.get(Uri.parse(_baseUrl+_search+_apiKey+'/'+search));
    if (response.statusCode == 200) {
      return SearchResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
