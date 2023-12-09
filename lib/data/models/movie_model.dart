import 'package:movie_app/data/vos/actor_vo.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';

abstract class MovieModel{
  //Network
  Future<List<MovieVO>> getNowPlayingMovies();
  Future<List<MovieVO>> getPopularMovies();
  Future<List<GenreVO>> getGenres();
  Future<List<MovieVO>> getMovieByGenre(int genreId);
  Future<List<MovieVO>> getTopRatedMovies();
  Future<List<ActorVO>> getBestActors();
  Future<List<List<ActorVO>>>getCreditsByMovies(int movieId);
  Future<MovieVO?> getMovieDetail(int movieId);


  //Database
  Future<List<MovieVO>> getNowPlayingMoviesFromDatabase();
  Future<List<MovieVO>> getPopularMoviesFromDatabase();
  Future<List<GenreVO>> getGenresFromDatabase();
  Future<List<MovieVO>> getTopRatedMoviesFromDatabase();
  Future<List<ActorVO>> getBestActorsFromDatabase();
  Future<MovieVO?> getMovieDetailFromDatabase(int movieId);

}