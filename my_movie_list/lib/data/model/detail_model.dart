import 'movie_list_model.dart';

class DetailResult {
  DetailResult({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.fullTitle,
    required this.type,
    required this.year,
    required this.image,
    required this.releaseDate,
    required this.runtimeMins,
    required this.runtimeStr,
    required this.plot,
    required this.plotLocal,
    required this.plotLocalIsRtl,
    required this.awards,
    required this.directors,
    required this.directorList,
    required this.writers,
    required this.writerList,
    required this.stars,
    required this.starList,
    required this.actorList,
    this.fullCast,
    required this.genres,
    required this.genreList,
    required this.companies,
    required this.companyList,
    required this.countries,
    required this.countryList,
    required this.languages,
    required this.languageList,
    required this.contentRating,
    required this.imDbRating,
    required this.imDbRatingVotes,
    required this.metacriticRating,
    this.ratings,
    this.wikipedia,
    required this.posters,
    this.images,
    this.trailer,
    required this.boxOffice,
    this.tagline,
    required this.keywords,
    required this.keywordList,
    required this.similars,
    this.tvSeriesInfo,
    this.tvEpisodeInfo,
    this.errorMessage,
  });

  String id;
  String? title;
  String? originalTitle;
  String? fullTitle;
  String? type;
  String year;
  String? image;
  DateTime releaseDate;
  String? runtimeMins;
  String? runtimeStr;
  String? plot;
  String? plotLocal;
  bool? plotLocalIsRtl;
  String? awards;
  String? directors;
  List<CompanyListElement> directorList;
  String? writers;
  List<CompanyListElement> writerList;
  String? stars;
  List<CompanyListElement> starList;
  List<ActorList> actorList;
  dynamic fullCast;
  String? genres;
  List<CountryListElement> genreList;
  String? companies;
  List<CompanyListElement> companyList;
  String? countries;
  List<CountryListElement> countryList;
  String? languages;
  List<CountryListElement> languageList;
  String? contentRating;
  String? imDbRating;
  String? imDbRatingVotes;
  String? metacriticRating;
  dynamic ratings;
  dynamic wikipedia;
  Posters posters;
  dynamic images;
  dynamic trailer;
  BoxOffice boxOffice;
  dynamic tagline;
  String? keywords;
  List<String> keywordList;
  List<MovieItem> similars;
  dynamic tvSeriesInfo;
  dynamic tvEpisodeInfo;
  dynamic errorMessage;

  factory DetailResult.fromJson(Map<String, dynamic> json) => DetailResult(
    id: json["id"],
    title: json["title"],
    originalTitle: json["originalTitle"],
    fullTitle: json["fullTitle"],
    type: json["type"],
    year: json["year"],
    image: json["image"],
    releaseDate: DateTime.parse(json["releaseDate"]),
    runtimeMins: json["runtimeMins"],
    runtimeStr: json["runtimeStr"],
    plot: json["plot"],
    plotLocal: json["plotLocal"],
    plotLocalIsRtl: json["plotLocalIsRtl"],
    awards: json["awards"],
    directors: json["directors"],
    directorList: List<CompanyListElement>.from(json["directorList"].map((x) => CompanyListElement.fromJson(x))),
    writers: json["writers"],
    writerList: List<CompanyListElement>.from(json["writerList"].map((x) => CompanyListElement.fromJson(x))),
    stars: json["stars"],
    starList: List<CompanyListElement>.from(json["starList"].map((x) => CompanyListElement.fromJson(x))),
    actorList: List<ActorList>.from(json["actorList"].map((x) => ActorList.fromJson(x))),
    fullCast: json["fullCast"],
    genres: json["genres"],
    genreList: List<CountryListElement>.from(json["genreList"].map((x) => CountryListElement.fromJson(x))),
    companies: json["companies"],
    companyList: List<CompanyListElement>.from(json["companyList"].map((x) => CompanyListElement.fromJson(x))),
    countries: json["countries"],
    countryList: List<CountryListElement>.from(json["countryList"].map((x) => CountryListElement.fromJson(x))),
    languages: json["languages"],
    languageList: List<CountryListElement>.from(json["languageList"].map((x) => CountryListElement.fromJson(x))),
    contentRating: json["contentRating"],
    imDbRating: json["imDbRating"],
    imDbRatingVotes: json["imDbRatingVotes"],
    metacriticRating: json["metacriticRating"],
    ratings: json["ratings"],
    wikipedia: json["wikipedia"],
    posters: Posters.fromJson(json["posters"]),
    images: json["images"],
    trailer: json["trailer"],
    boxOffice: BoxOffice.fromJson(json["boxOffice"]),
    tagline: json["tagline"],
    keywords: json["keywords"],
    keywordList: List<String>.from(json["keywordList"].map((x) => x)),
    similars: List<MovieItem>.from(json["similars"].map((x) => MovieItem.fromJson(x))),
    tvSeriesInfo: json["tvSeriesInfo"],
    tvEpisodeInfo: json["tvEpisodeInfo"],
    errorMessage: json["errorMessage"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "originalTitle": originalTitle,
    "fullTitle": fullTitle,
    "type": type,
    "year": year,
    "image": image,
    "releaseDate": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
    "runtimeMins": runtimeMins,
    "runtimeStr": runtimeStr,
    "plot": plot,
    "plotLocal": plotLocal,
    "plotLocalIsRtl": plotLocalIsRtl,
    "awards": awards,
    "directors": directors,
    "directorList": List<dynamic>.from(directorList.map((x) => x.toJson())),
    "writers": writers,
    "writerList": List<dynamic>.from(writerList.map((x) => x.toJson())),
    "stars": stars,
    "starList": List<dynamic>.from(starList.map((x) => x.toJson())),
    "actorList": List<dynamic>.from(actorList.map((x) => x.toJson())),
    "fullCast": fullCast,
    "genres": genres,
    "genreList": List<dynamic>.from(genreList.map((x) => x.toJson())),
    "companies": companies,
    "companyList": List<dynamic>.from(companyList.map((x) => x.toJson())),
    "countries": countries,
    "countryList": List<dynamic>.from(countryList.map((x) => x.toJson())),
    "languages": languages,
    "languageList": List<dynamic>.from(languageList.map((x) => x.toJson())),
    "contentRating": contentRating,
    "imDbRating": imDbRating,
    "imDbRatingVotes": imDbRatingVotes,
    "metacriticRating": metacriticRating,
    "ratings": ratings,
    "wikipedia": wikipedia,
    "posters": posters.toJson(),
    "images": images,
    "trailer": trailer,
    "boxOffice": boxOffice.toJson(),
    "tagline": tagline,
    "keywords": keywords,
    "keywordList": List<dynamic>.from(keywordList.map((x) => x)),
    "similars": List<dynamic>.from(similars.map((x) => x.toJson())),
    "tvSeriesInfo": tvSeriesInfo,
    "tvEpisodeInfo": tvEpisodeInfo,
    "errorMessage": errorMessage,
  };
}

class ActorList {
  ActorList({
    required this.id,
    required this.image,
    required this.name,
    required this.asCharacter,
  });

  String id;
  String image;
  String name;
  String asCharacter;

  factory ActorList.fromJson(Map<String, dynamic> json) => ActorList(
    id: json["id"],
    image: json["image"],
    name: json["name"],
    asCharacter: json["asCharacter"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "name": name,
    "asCharacter": asCharacter,
  };
}

class BoxOffice {
  BoxOffice({
    required this.budget,
    required this.openingWeekendUsa,
    required this.grossUsa,
    required this.cumulativeWorldwideGross,
  });

  String budget;
  String openingWeekendUsa;
  String grossUsa;
  String cumulativeWorldwideGross;

  factory BoxOffice.fromJson(Map<String, dynamic> json) => BoxOffice(
    budget: json["budget"],
    openingWeekendUsa: json["openingWeekendUSA"],
    grossUsa: json["grossUSA"],
    cumulativeWorldwideGross: json["cumulativeWorldwideGross"],
  );

  Map<String, dynamic> toJson() => {
    "budget": budget,
    "openingWeekendUSA": openingWeekendUsa,
    "grossUSA": grossUsa,
    "cumulativeWorldwideGross": cumulativeWorldwideGross,
  };
}

class CompanyListElement {
  CompanyListElement({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory CompanyListElement.fromJson(Map<String, dynamic> json) => CompanyListElement(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class CountryListElement {
  CountryListElement({
    required this.key,
    required this.value,
  });

  String key;
  String value;

  factory CountryListElement.fromJson(Map<String, dynamic> json) => CountryListElement(
    key: json["key"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "value": value,
  };
}

class Posters {
  Posters({
    required this.imDbId,
    required this.title,
    required this.fullTitle,
    required this.type,
    required this.year,
    required this.posters,
    required this.backdrops,
    required this.errorMessage,
  });

  String imDbId;
  String title;
  String fullTitle;
  String type;
  String year;
  List<Backdrop> posters;
  List<Backdrop> backdrops;
  String errorMessage;

  factory Posters.fromJson(Map<String, dynamic> json) => Posters(
    imDbId: json["imDbId"],
    title: json["title"],
    fullTitle: json["fullTitle"],
    type: json["type"],
    year: json["year"],
    posters: List<Backdrop>.from(json["posters"].map((x) => Backdrop.fromJson(x))),
    backdrops: List<Backdrop>.from(json["backdrops"].map((x) => Backdrop.fromJson(x))),
    errorMessage: json["errorMessage"],
  );

  Map<String, dynamic> toJson() => {
    "imDbId": imDbId,
    "title": title,
    "fullTitle": fullTitle,
    "type": type,
    "year": year,
    "posters": List<dynamic>.from(posters.map((x) => x.toJson())),
    "backdrops": List<dynamic>.from(backdrops.map((x) => x.toJson())),
    "errorMessage": errorMessage,
  };
}

class Backdrop {
  Backdrop({
    required this.id,
    required this.link,
    required this.aspectRatio,
    required this.width,
    required this.height,
  });

  String id;
  String link;
  double aspectRatio;
  int width;
  int height;

  factory Backdrop.fromJson(Map<String, dynamic> json) => Backdrop(
    id: json["id"],
    link: json["link"],
    aspectRatio: json["aspectRatio"].toDouble(),
    width: json["width"],
    height: json["height"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "link": link,
    "aspectRatio": aspectRatio,
    "width": width,
    "height": height,
  };
}

