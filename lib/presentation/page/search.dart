import 'package:flutter/material.dart';
import 'package:mymovielist/common/constants.dart';
import 'package:mymovielist/common/state_enum.dart';
import 'package:mymovielist/presentation/provider/movie_search_notifier.dart';
import 'package:mymovielist/presentation/widget/movie_card.dart';
import 'package:provider/provider.dart';

class MovieSearch extends StatelessWidget {
  const MovieSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onSubmitted: (query) {
                Provider.of<MovieSearchNotifier>(context, listen: false)
                    .fetchMovieSearch(query);
              },
              decoration: InputDecoration(
                hintText: 'Search Movie',
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.blue,
                  ),
                ),
              ),
              textInputAction: TextInputAction.search,
            ),
            const SizedBox(height: 8),
            Text(
              'Search Result',
              style: heading6,
            ),
            const SizedBox(height: 8),
            Consumer<MovieSearchNotifier>(builder: (context, data, child) {
              if (data.state == RequestState.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (data.state == RequestState.hasData) {
                return ListView.builder(itemBuilder: (context, index) {
                  final movie = data.searchMovieResult.results[index];
                  return MovieCard(movie: movie);
                });
              } else {
                return const Center(
                  child: Text("Search"),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
