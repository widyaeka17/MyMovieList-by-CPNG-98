import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mymovielist/common/constants.dart';
import 'package:mymovielist/data/models/movie_search_model.dart';

class MovieCard extends StatelessWidget {
  final Result movie;
  const MovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: (() {}),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                child: CachedNetworkImage(
                  imageUrl: movie.image,
                  width: 70,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: heading6,
                    ),
                    const SizedBox(height: 8),
                    Text(movie.description),
                    const SizedBox(height: 16),
                    // Container(
                    //   decoration: BoxDecoration(
                    //       color: Colors.grey.shade300,
                    //       borderRadius: BorderRadius.circular(12)),
                    //   height: 25,
                    //   width: 50,
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //     children: [
                    //       const Icon(
                    //         Icons.star,
                    //         color: Colors.yellow,
                    //         size: 15,
                    //       ),
                    //       Text(
                    //         movie.title,
                    //         style: ratingText,
                    //       ),
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              )
            ],
          ),
        ),
        const Divider(
          height: 20,
          thickness: 2,
        )
      ],
    );
  }
}
