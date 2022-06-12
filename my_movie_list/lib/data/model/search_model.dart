import 'package:my_movie_list/data/model/movie_list_model.dart';

class SearchResult {
  SearchResult({
    required this.searchType,
    required this.expression,
    required this.results,
    required this.errorMessage,
  });

  String searchType;
  String expression;
  List<MovieItem> results;
  String errorMessage;

  factory SearchResult.fromJson(Map<String, dynamic> json) => SearchResult(
    searchType: json["searchType"],
    expression: json["expression"],
    results: List<MovieItem>.from(json["results"].map((x) => MovieItem.fromJson(x))),
    errorMessage: json["errorMessage"],
  );

  Map<String, dynamic> toJson() => {
    "searchType": searchType,
    "expression": expression,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
    "errorMessage": errorMessage,
  };
}