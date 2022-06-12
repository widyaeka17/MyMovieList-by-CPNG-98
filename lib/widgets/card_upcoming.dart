import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/model/movie_list_model.dart';
import '../provider/database_provider.dart';
import '../ui/detail_page.dart';

class CardUpcoming extends StatelessWidget {
  final MovieItem upcomingMovies;

  const CardUpcoming({required this.upcomingMovies});

  @override
  Widget build(BuildContext context) {
    Widget? icon;

    if (upcomingMovies.releaseState != null){
      icon = Icon(Platform.isIOS ? CupertinoIcons.calendar : Icons.calendar_month,);
    }
    return Consumer<DatabaseProvider>(
        builder: (context, provider, child) {
          return FutureBuilder<bool>(
              future: provider.isWatchlisted(upcomingMovies.id),
        builder: (context, snapshot) {
          //var isBookmarked = snapshot.data ?? false;
      return Material(
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, MovieItemsDetailPage.routeName,
                arguments: upcomingMovies);
          },
          child: Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Image.network(
                    upcomingMovies.image!,
                    width: 100,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 3),
                          child: Text(
                            upcomingMovies.title,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 3),
                        Row(
                            children: <Widget>[
                              SizedBox(width: 3.0),
                              Flexible(child: Text(upcomingMovies.genres ??
                                  upcomingMovies.description ?? '')),
                            ]
                        ),
                        SizedBox(height: 3),
                        Row(
                            children: <Widget>[
                              icon ?? SizedBox(width: 3.0),
                              SizedBox(width: 3.0),
                              Text(upcomingMovies.releaseState ?? ''),
                            ],
                        ),
                        // isBookmarked
                        //     ? IconButton(
                        //   icon: Icon(Icons.bookmark),
                        //   color: Theme.of(context).colorScheme.secondary,
                        //   onPressed: () => provider.removeWatchlist(upcomingMovies.id),
                        // )
                        //     : IconButton(
                        //   icon: Icon(Icons.bookmark_border),
                        //   color: Theme.of(context).colorScheme.secondary,
                        //   onPressed: () => provider.addWatchlist(upcomingMovies),
                        // ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }
    );
    }
    );
  }
}
