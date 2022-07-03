import '../data/model/detail_model.dart';
import '../data/model/movie_list_model.dart';

MovieItem convert(DetailResult detailMovieItem) {
  return MovieItem(
    id: detailMovieItem.id,
    title: detailMovieItem.title!,
    fullTitle: detailMovieItem.fullTitle!,
    year: detailMovieItem.year,
    image: detailMovieItem.image,
    imDbRating: detailMovieItem.imDbRating,
    imDbRatingCount: detailMovieItem.imDbRatingVotes,
    genres: detailMovieItem.genres,
    releaseState: detailMovieItem.type,
    description: detailMovieItem.plot,
  );
}
