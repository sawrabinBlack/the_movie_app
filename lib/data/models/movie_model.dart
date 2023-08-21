import 'package:movie_app/data/vos/actor_vo.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';

abstract class MovieModel{
  Future<List<MovieVO>?> getNowPlayingMovies();
  Future<List<MovieVO>?> getPopularMovies();
  Future<List<GenreVO>?> getGenres();
  Future<List<MovieVO>?> getMovieByGenre(int genreId);
  Future<List<MovieVO>?> getTopRatedMovies();
  Future<List<ActorVO>?> getBestActors();
}