import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/api/api_service.dart';
import '../data/model/movie_list_model.dart';
import '../provider/detail_provider.dart';
import '../utils/result_state.dart';
import '../widgets/detail_widget.dart';
import '../widgets/platform_widget.dart';

class MovieItemsDetailPage extends StatelessWidget {
  static const routeName = '/movie_detail';

  final MovieItem movie;

  const MovieItemsDetailPage({Key? key, required this.movie}) : super(key: key);

  Widget _buildDetail(BuildContext context) {
    return ChangeNotifierProvider<DetailProvider>(
      create: (_) => DetailProvider(apiService: ApiService(), id: movie.id),
      child: Scaffold(
        appBar: AppBar(
          title: Text(movie.title),
        ),
        body: Consumer<DetailProvider>(builder: (context, state, _) {
          if (state.state == ResultState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.state == ResultState.hasData) {
            return Scaffold(
              body: MovieDetail(
                movieDetail: state.result,
              ),
            );
          } else if (state.state == ResultState.noData) {
            return Center(child: Text(state.message));
          } else if (state.state == ResultState.error) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text(''));
          }
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
        androidBuilder: _buildDetail, iosBuilder: _buildDetail);
  }
}
