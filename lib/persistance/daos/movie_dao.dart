import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/persistance/hive_constants.dart';

class MovieDao {
  static final MovieDao _singleton = MovieDao._internal();

  factory MovieDao() {
    return _singleton;
  }

  MovieDao._internal();

  void saveAllMovie(List<MovieVO> genreList) {
    Map<int, MovieVO> genreMap = Map.fromIterable(genreList,
        key: (genre) => genre.id, value: (genre) => genre);
    getMovieVOBox().putAll(genreMap);
  }

  List<MovieVO> getAllMovies() {
    return getMovieVOBox().values.toList();
  }

  Box<MovieVO> getMovieVOBox() {
    return Hive.box(BOX_NAME_MOVIE_VO);
  }

  MovieVO? getSingleMovie(int movieId) {
    return getMovieVOBox().get(movieId);
  }


  void  saveSingleMovie(MovieVO movie){
    getMovieVOBox().put(movie.id, movie);
  }


}
