class GenreModel {
  GenreModel({
    required this.key,
    required this.value,
  });

  String key;
  String value;

  factory GenreModel.fromJson(Map<String, dynamic> json) => GenreModel(
        key: json["key"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
      };
}
