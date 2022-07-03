import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/model/movie_list_model.dart';
import '../provider/database_provider.dart';
import '../ui/detail_page.dart';

class CardUpcoming extends StatelessWidget {
  final MovieItem upcomingMovies;

  const CardUpcoming({Key? key, required this.upcomingMovies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget? icon;

    if (upcomingMovies.releaseState != null) {
      icon = Icon(
        Platform.isIOS ? CupertinoIcons.calendar : Icons.calendar_month,
      );
    }
    return Consumer<DatabaseProvider>(builder: (context, provider, child) {
      return FutureBuilder<bool>(
          future: provider.isWatchlisted(upcomingMovies.id),
          builder: (context, snapshot) {
            var img = upcomingMovies.image ?? 'https://cdn.pixabay.com/photo/2012/08/27/22/59/movie-projector-55122__340.png';
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
                          img,
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
                                padding: const EdgeInsets.only(left: 3),
                                child: Text(
                                  upcomingMovies.title,
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 3),
                              Row(children: <Widget>[
                                const SizedBox(width: 3.0),
                                Flexible(
                                    child: Text(upcomingMovies.genres ??
                                        upcomingMovies.description ??
                                        '')),
                              ]),
                              const SizedBox(height: 3),
                              Row(
                                children: <Widget>[
                                  icon ?? const SizedBox(width: 3.0),
                                  const SizedBox(width: 3.0),
                                  Text(upcomingMovies.releaseState ?? ''),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          });
    });
  }
}
