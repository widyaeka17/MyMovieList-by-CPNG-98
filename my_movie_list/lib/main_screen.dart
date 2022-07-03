import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_movie_list/data/model/movie_list_model.dart';
import 'package:my_movie_list/provider/database_provider.dart';
import 'package:my_movie_list/provider/in_theaters_provider.dart';
import 'package:my_movie_list/provider/popular_provider.dart';
import 'package:my_movie_list/provider/preferences_provider.dart';
import 'package:my_movie_list/provider/search_provider.dart';
import 'package:my_movie_list/provider/upcoming_provider.dart';
import 'package:my_movie_list/ui/detail_page.dart';
import 'package:my_movie_list/ui/home_page.dart';
import 'package:my_movie_list/ui/in_theaters_list.dart';
import 'package:my_movie_list/ui/login_page.dart';
import 'package:my_movie_list/ui/popular_list.dart';
import 'package:my_movie_list/ui/profil_page.dart';
import 'package:my_movie_list/ui/search_page.dart';
import 'package:my_movie_list/ui/setting_page.dart';
import 'package:my_movie_list/ui/sign_up.dart';
import 'package:my_movie_list/ui/upcoming_list.dart';
import 'package:my_movie_list/ui/watchlist_page.dart';
import 'package:my_movie_list/ui/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/api/api_service.dart';
import 'data/db/database_helper.dart';
import 'data/preferences/preferences_helper.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PopularProvider>(
          create: (_) => PopularProvider(apiService: ApiService()),
          child: const UpcomingListPage(),
        ),
        ChangeNotifierProvider<UpcomingProvider>(
          create: (_) => UpcomingProvider(apiService: ApiService()),
          child: const PopularListPage(),
        ),
        ChangeNotifierProvider<InTheatersProvider>(
          create: (_) => InTheatersProvider(apiService: ApiService()),
          child: const InTheatersListPage(),
        ),
        ChangeNotifierProvider(
          create: (_) => PreferencesProvider(
            preferencesHelper: PreferencesHelper(
              sharedPreferences: SharedPreferences.getInstance(),
            ),
          ),
        ),
        ChangeNotifierProvider<MovieSearchProvider>(
          create: (_) => MovieSearchProvider(apiService: ApiService()),
        ),
        ChangeNotifierProvider(
          create: (_) => DatabaseProvider(databaseHelper: DatabaseHelper()),
        ),
      ],
      child: Consumer<PreferencesProvider>(
        builder: (context, provider, child) {
          return MaterialApp(
            title: 'My Movie List',
            theme: provider.themeData,
            builder: (context, child) {
              return CupertinoTheme(
                data: CupertinoThemeData(
                  brightness:
                      provider.isDarkTheme ? Brightness.dark : Brightness.light,
                ),
                child: Material(
                  child: child,
                ),
              );
            },
            initialRoute: Wrapper.routeName,
            routes: {
              HomePage.routeName: (context) => const HomePage(),
              UpcomingListPage.routeName: (context) => const UpcomingListPage(),
              PopularListPage.routeName: (context) => const PopularListPage(),
              InTheatersListPage.routeName: (context) =>
                  const InTheatersListPage(),
              SettingsPage.routeName: (context) => const SettingsPage(),
              MovieItemsDetailPage.routeName: (context) => MovieItemsDetailPage(
                    movie:
                        ModalRoute.of(context)?.settings.arguments as MovieItem,
                  ),
              MovieSearchPage.routeName: (context) => const MovieSearchPage(),
              WatchlistPage.routeName: (context) => const WatchlistPage(),
              ProfilPage.routeName: (context) => const ProfilPage(),
              Wrapper.routeName: (context) => const Wrapper(),
              LoginPage.routeName: (context) => const LoginPage(),
              SignUpPage.routeName: (context) => const SignUpPage(),
            },
          );
        },
      ),
    );
  }
}
