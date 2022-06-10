import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  Future<FilmList> listDataComingSoon() async {
    try {
      final response = await http.get(Uri.parse("https://imdb-api.com/en/API/ComingSoon/k_574u1868"));
      if (response.statusCode == 200) {
        print("data here");
        return FilmList.fromJson(json.decode(response.body));
      } else {
        throw Exception("Gagal Mengambil Data");
      }
    } catch (e) {
      throw Exception("Tidak Ada Koneksi Internet");
    }
  }

  Future<FilmList> listDataPopular() async {
    try {
      final response = await http.get(Uri.parse("https://imdb-api.com/en/API/MostPopularMovies/k_574u1868"));
      if (response.statusCode == 200) {
        print("data here");
        return FilmList.fromJson(json.decode(response.body));
      } else {
        throw Exception("Gagal Mengambil Data");
      }
    } catch (e) {
      throw Exception("Tidak Ada Koneksi Internet");
    }
  }

  Future<FilmList> listDataTeater() async {
    try {
      final response = await http.get(Uri.parse("https://imdb-api.com/en/API/InTheaters/k_574u1868"));
      if (response.statusCode == 200) {
        print("data here");
        return FilmList.fromJson(json.decode(response.body));
      } else {
        throw Exception("Gagal Mengambil Data");
      }
    } catch (e) {
      throw Exception("Tidak Ada Koneksi Internet");
    }
  }
}

class FilmList {
  FilmList({
    required this.items,
    required this.errorMessage,
  });

  List<Item> items;
  String errorMessage;

  factory FilmList.fromJson(Map<String, dynamic> json) => FilmList(
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    errorMessage: json["errorMessage"],
  );

  Map<String, dynamic> toJson() => {
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "errorMessage": errorMessage,
  };
}

class Item {
  Item({
    required this.id,
    required this.title,
    required this.fullTitle,
    required this.year,
    required this.image,
    required this.imDbRating,
    required this.imDbRatingCount,
  });

  String id;
  String title;
  String fullTitle;
  String year;
  String image;
  String imDbRating;
  String imDbRatingCount;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    title: json["title"],
    fullTitle: json["fullTitle"],
    year: json["year"],
    image: json["image"],
    imDbRating: json["imDbRating"],
    imDbRatingCount: json["imDbRatingCount"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "fullTitle": fullTitle,
    "year": year,
    "image": image,
    "imDbRating": imDbRating,
    "imDbRatingCount": imDbRatingCount,
  };
}
