class MovieResult {
  MovieResult({
    required this.items,
    required this.errorMessage,
  });

  List<MovieItem> items;
  String errorMessage;

  factory MovieResult.fromJson(Map<String, dynamic> json) => MovieResult(
    items: List<MovieItem>.from(json["items"].map((x) => MovieItem.fromJson(x))),
    errorMessage: json["errorMessage"],
  );

  Map<String, dynamic> toJson() => {
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "errorMessage": errorMessage,
  };
}

class MovieItem {
  MovieItem({
    required this.id,
    required this.title,
    required this.fullTitle,
    required this.year,
    required this.image,
    required this.imDbRating,
    required this.imDbRatingCount,
    required this.genres,
    required this.releaseState,
    required this.description
  });

  String id;
  String title;
  String? fullTitle;
  String? year;
  String? image;
  String? imDbRating;
  String? imDbRatingCount;
  String? genres;
  String? releaseState;
  String? description;

  factory MovieItem.fromJson(Map<String, dynamic> json) => MovieItem(
    id: json["id"],
    title: json["title"],
    fullTitle: json["fullTitle"],
    year: json["year"],
    image: json["image"],
    imDbRating: json["imDbRating"],
    imDbRatingCount: json["imDbRatingCount"],
    genres: json["genres"],
    releaseState: json["releaseState"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "fullTitle": fullTitle,
    "year": year,
    "image": image,
    "imDbRating": imDbRating,
    "imDbRatingCount": imDbRatingCount,
    "genres": genres,
    "releaseState": releaseState,
  };
}
