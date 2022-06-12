import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../data/model/movie_list_model.dart';
import '../ui/detail_page.dart';

class CardPopular extends StatelessWidget {
  final MovieItem popularMovies;

  const CardPopular({required this.popularMovies});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, MovieItemsDetailPage.routeName,
              arguments: popularMovies);
        },
        child: Card(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Image.network(
                  popularMovies.image!,
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
                          popularMovies.fullTitle!,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 3),
                      Row(
                          children: <Widget>[
                            Icon(Platform.isIOS ? CupertinoIcons.calendar : Icons.calendar_month,),
                            SizedBox(width: 3.0),
                            Text(popularMovies.year!),
                          ]
                      ),
                      SizedBox(height: 3),
                      Row(
                          children: <Widget>[
                            Icon(
                              Platform.isIOS ? CupertinoIcons.star : Icons.star,
                              color: Colors.orange,
                            ),
                            SizedBox(width: 3.0),
                            Text(popularMovies.imDbRating!),
                          ]
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
  }
}
