import 'package:sqflite/sqflite.dart';

import '../model/movie_list_model.dart';

class DatabaseHelper {
  static DatabaseHelper? _instance;
  static Database? _database;

  DatabaseHelper._internal() {
    _instance = this;
  }

  factory DatabaseHelper() => _instance ?? DatabaseHelper._internal();

  static const String _tblWatchlist = 'watchlist';

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      '$path/mymovielist.db',
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE $_tblWatchlist (
             id TEXT PRIMARY KEY,
             title TEXT,
             fullTitle TEXT,
             year TEXT,
             image TEXT,
             imDbRating TEXT,
             imDbRatingCount TEXT,
             genres TEXT,
             releaseState TEXT,
             description TEXT
           )     
        ''');
      },
      version: 1,
    );

    return db;
  }

  Future<Database?> get database async {
    if (_database == null) {
      _database = await _initializeDb();
    }

    return _database;
  }

  Future<void> insertWatchlist(MovieItem article) async {
    final db = await database;
    await db!.insert(_tblWatchlist, article.toJson());
  }

  Future<List<MovieItem>> getWatchlists() async {
    final db = await database;
    List<Map<String, dynamic>> results = await db!.query(_tblWatchlist);

    return results.map((res) => MovieItem.fromJson(res)).toList();
  }

  Future<Map> getWatchlistById(String url) async {
    final db = await database;

    List<Map<String, dynamic>> results = await db!.query(
      _tblWatchlist,
      where: 'id = ?',
      whereArgs: [url],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return {};
    }
  }

  Future<void> removeWatchlist(String url) async {
    final db = await database;

    await db!.delete(
      _tblWatchlist,
      where: 'id = ?',
      whereArgs: [url],
    );
  }
}
