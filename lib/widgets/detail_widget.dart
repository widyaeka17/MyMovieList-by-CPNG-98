import 'dart:io';

import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_movie_list/data/model/movie_list_model.dart';
import 'package:provider/provider.dart';

import '../data/model/detail_model.dart';
import '../provider/database_provider.dart';
import '../ui/detail_page.dart';

class MovieDetail extends StatelessWidget {

  final DetailResult movieDetail;
  final MovieItem movie;

  const MovieDetail({required this.movieDetail , required this.movie});

  @override
  Widget build(BuildContext context) {
    Widget image;
    if (movieDetail.posters.backdrops.isEmpty){
      image = Container(
        margin: const EdgeInsets.only( top: 5),
        height: (MediaQuery.of(context).size.height * 0.25),
        child: Image.network(movieDetail.image!, fit: BoxFit.cover, width: 1000,),
      );
    }else{
      image = Container(
        margin: const EdgeInsets.only( top: 5),
        height: (MediaQuery.of(context).size.height * 0.25),
        child: Image.network(movieDetail.posters.backdrops[0].link, fit: BoxFit.cover, width: 1000,),
      );
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movieDetail.title!,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 30.0,
                      fontFamily: 'Staatliches',
                    ),
                  ),
                  Row(
                      children: <Widget>[
                        Text(movieDetail.year),
                        SizedBox(width: 15.0),
                        Text(movieDetail.runtimeStr ?? 'TV Series'),
                      ]
                  ),
                ],
              ),
            ),
            image,
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Consumer<DatabaseProvider>(
                builder: (context, provider, child) {
                  return FutureBuilder<bool>(
                      future: provider.isWatchlisted(movieDetail.id),
                      builder: (context, snapshot) {
                        var isBookmarked = snapshot.data ?? false;
                        return Container(
                          width: 1000,
                          height: 40,
                          child: isBookmarked
                            ?TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.yellow.shade700),
                            onPressed: () => provider.removeWatchlist(movieDetail.id),
                            child: Row(
                              children: [
                                Icon(Platform.isIOS ? CupertinoIcons.check_mark : Icons
                                    .check,),
                                SizedBox(width: 10),
                                Text(
                                    "Add to Watchlist"
                                ),
                              ],
                            ),
                          )
                          :TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.yellow.shade700),
                            onPressed: () => provider.addWatchlist(movie),
                            child: Row(
                              children: [
                                Icon(Platform.isIOS ? CupertinoIcons.add : Icons
                                    .add,),
                                SizedBox(width: 10),
                                Text(
                                    "Add to Watchlist"
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                }),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Icon(Platform.isIOS ? CupertinoIcons.star_fill : Icons.star, color: Colors.orange,),
                            SizedBox(height: 5.0),
                            Text(
                              movieDetail.imDbRating ?? '-',
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              color: Colors.green,
                              child: Text(
                                movieDetail.metacriticRating ?? '-'
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              'Metacritics',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    height: 20,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: movieDetail.genreList.length,
                        itemBuilder: (context, index) {
                          var data = movieDetail.genreList[index];
                          return Container(
                            width: 60,
                            margin: const EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Colors.grey.shade600,
                                  width: 1,
                                )
                            ),
                            child: Text(
                              data.value,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          );
                        }
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: ExpandText(
                      movieDetail.plot!,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'Oxygen',
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  const Text(
                    'Director',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Staatliches',
                    ),
                  ),
                  Text(
                    movieDetail.directors!,
                    style: const TextStyle(
                      fontSize: 15.0,
                      fontFamily: 'Staatliches',
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const Text(
                    'Writers',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Staatliches',
                    ),
                  ),
                  Text(
                    movieDetail.writers!,
                    style: const TextStyle(
                      fontSize: 15.0,
                      fontFamily: 'Staatliches',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  const Text(
                    'Actors',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Staatliches',
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: movieDetail.actorList.map((actor) {
                        return Card(
                          child: Container(
                            width: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Image.network(
                                    actor.image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Padding(
                                  padding: const EdgeInsets.only(left: 0.0),
                                  child: Text(
                                    actor.name,
                                    textAlign: TextAlign.left,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Padding(
                                  padding: const EdgeInsets.only(left: 0.0),
                                  child: Text(
                                    'as '+actor.asCharacter,
                                    textAlign: TextAlign.left,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 11.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 10),
                  const Text(
                    'More Like This',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Staatliches',
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: movieDetail.similars.map((similar) {
                        return Card(
                          child: InkWell(
                              onTap: () {
                              Navigator.pushNamed(context, MovieItemsDetailPage.routeName,
                                  arguments: similar);
                            },
                            child: Container(
                              width: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Image.network(
                                      similar.image!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 0.0),
                                    child: Text(
                                      similar.title,
                                      textAlign: TextAlign.left,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


