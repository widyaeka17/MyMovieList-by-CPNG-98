import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../data/model/movie_list_model.dart';
import '../ui/detail_page.dart';

class CardInTheaters extends StatelessWidget {
  final MovieItem inTheatersMovies;

  const CardInTheaters({Key? key, required this.inTheatersMovies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, MovieItemsDetailPage.routeName,
              arguments: inTheatersMovies);
        },
        child: Card(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Image.network(
                  inTheatersMovies.image!,
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
                          inTheatersMovies.fullTitle!,
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 3),
                      Row(children: <Widget>[
                        const SizedBox(width: 3.0),
                        Flexible(child: Text(inTheatersMovies.genres!)),
                      ]),
                      const SizedBox(height: 3),
                      Row(children: <Widget>[
                        Icon(
                          Platform.isIOS
                              ? CupertinoIcons.calendar
                              : Icons.calendar_month,
                        ),
                        const SizedBox(width: 3.0),
                        Text(inTheatersMovies.releaseState!),
                      ]),
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
}
