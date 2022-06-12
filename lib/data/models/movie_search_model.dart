class MovieSearchModel {
  MovieSearchModel({
    required this.searchType,
    required this.expression,
    required this.results,
    required this.errorMessage,
  });

  String searchType;
  String expression;
  List<Result> results;
  String errorMessage;

  factory MovieSearchModel.fromJson(Map<String, dynamic> json) =>
      MovieSearchModel(
          searchType: json["searchtype"],
          expression: json["expression"],
          results:
              List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
          errorMessage: json["errorMessage"]);

  Map<String, dynamic> toJson() => {
        "searchType": searchType,
        "expression": expression,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "errorMessage": errorMessage,
      };
}

class Result {
  Result({
    required this.id,
    required this.title,
    required this.resultType,
    required this.description,
    required this.image,
  });

  String id;
  String title;
  String resultType;
  String description;
  String image;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        title: json["title"],
        resultType: json["resultType"],
        description: json["description"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "resultType": resultType,
        "description": description,
        "image": image,
      };
}
