import 'package:flutter/material.dart';
import 'package:mymovielist/common/constants.dart';
import 'package:mymovielist/data/datasource/movie_api.dart';
import 'package:mymovielist/presentation/page/search.dart';
import 'package:mymovielist/presentation/provider/movie_search_notifier.dart';
import 'package:mymovielist/presentation/widget/movie_navbar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      title: 'My Movie List',
      theme: ThemeData(
        primaryColor: Colors.blue,
        primarySwatch: Colors.blue,
        textTheme: movieTextTheme,
      ),
      home: ChangeNotifierProvider<MovieSearchNotifier>(
        create: (_) => MovieSearchNotifier(),
        child: const MovieSearch(),
      ),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => const MovieSearch(),
      // },
    );
  }
}
