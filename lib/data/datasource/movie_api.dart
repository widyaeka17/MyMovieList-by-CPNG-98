import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mymovielist/data/models/movie_search_model.dart';

class ApiService {
  static const String _baseUrl = 'https://imdb-api.com/en/API';
  static const String _apiKey = 'k_mvy4crq0';

  Future<MovieSearchModel> searchMovies(String query) async {
    try {
      final response =
          await http.get(Uri.parse('$_baseUrl/SearchMovie/$_apiKey/$query'));
      if (response.statusCode == 200) {
        return MovieSearchModel.fromJson(json.decode(response.body));
      } else {
        throw Exception('No Internet Connection');
      }
    } catch (e) {
      throw Exception("No data");
    }
  }

}
