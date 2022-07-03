import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_movie_list/widgets/card_popular.dart';
import 'package:provider/provider.dart';

import '../provider/database_provider.dart';
import '../utils/result_state.dart';
import '../widgets/platform_widget.dart';

class WatchlistPage extends StatelessWidget {
  static const routeName = '/watchlist-page';
  static const String watchlistTitle = 'Watchlist';

  const WatchlistPage({Key? key}) : super(key: key);

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(watchlistTitle),
      ),
      body: _buildList(),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(watchlistTitle),
      ),
      child: _buildList(),
    );
  }

  Widget _buildList() {
    return Consumer<DatabaseProvider>(
      builder: (context, provider, child) {
        if (provider.state == ResultState.hasData) {
          return ListView.builder(
            itemCount: provider.watchlist.length,
            itemBuilder: (context, index) {
              return CardPopular(popularMovies: provider.watchlist[index]);
            },
          );
        } else {
          return Center(
            child: Text(provider.message),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}
