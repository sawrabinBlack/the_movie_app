import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/data/vos/actor_vo.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/network/movie_data_agent.dart';
import 'package:movie_app/network/retrofit_data_agent_impl.dart';
import 'package:movie_app/persistance/daos/actor_dao.dart';
import 'package:movie_app/persistance/daos/genre_dao.dart';
import 'package:movie_app/persistance/daos/movie_dao.dart';

class MovieModelImpl extends MovieModel {
  static final MovieModelImpl _singleton = MovieModelImpl._internal();

  factory MovieModelImpl() {
    return _singleton;
  }

  MovieModelImpl._internal();

  final MovieDataAgent _dataAgent = RetrofitDataAgentImpl();

  //Daos
  MovieDao movieDao = MovieDao();
  GenreDao genreDao = GenreDao();
  ActorDao actorDao = ActorDao();

  @override
  Future<List<MovieVO>> getNowPlayingMovies() {
    return _dataAgent.getNowPlayingMovies(1).then((movies) {
      List<MovieVO> nowPlayingMovies = movies.map((movie) {
        movie.isNowPlaying = true;
        movie.isPopular = false;
        movie.isTopRated = false;
        return movie;
      }).toList();
      movieDao.saveAllMovie(nowPlayingMovies);
      return Future.value(movies);
    });
  }

  @override
  Future<List<MovieVO>> getPopularMovies() {
    return _dataAgent.getPopularMovies().then((movies) {
      List<MovieVO> popularMovies = movies.map((movie) {
        movie.isNowPlaying = false;
        movie.isPopular = true;
        movie.isTopRated = false;
        return movie;
      }).toList();
      movieDao.saveAllMovie(popularMovies);
      return Future.value(movies);
    });
  }

  @override
  Future<List<GenreVO>> getGenres() {
    return _dataAgent.getGenres().then((genres) {
      genreDao.saveAllGenre(genres);
      return Future.value(genres);
    });
  }

  @override
  Future<List<MovieVO>> getMovieByGenre(int genreId) {
    return _dataAgent.getMovieByGenre(genreId);
  }

  @override
  Future<List<MovieVO>> getTopRatedMovies() {
    return _dataAgent.getTopRatedMovies().then((movies) {
      List<MovieVO> popularMovies = movies.map((movie) {
        movie.isNowPlaying = false;
        movie.isPopular = false;
        movie.isTopRated = true;
        return movie;
      }).toList();
      movieDao.saveAllMovie(popularMovies);
      return Future.value(movies);
    });
  }

  @override
  Future<List<ActorVO>> getBestActors() {
    return _dataAgent.getBestActors();
  }

  @override
  Future<List<List<ActorVO>>> getCreditsByMovies(int movieId) {
    return _dataAgent.getCreditsByMovies(movieId);
  }

  @override
  Future<MovieVO> getMovieDetail(int movieId) {
    return _dataAgent.getMovieDetails(movieId).then((movie){
      movieDao.saveSingleMovie(movie);
      return Future.value(movie);
    });
  }

  @override
  Future<List<ActorVO>> getBestActorsFromDatabase() {
    return Future.value(actorDao.getAllActors().toList());
  }


  @override
  Future<List<GenreVO>> getGenresFromDatabase() {
    return Future.value(genreDao.getAllGenre().toList());
  }


  @override
  Future<MovieVO?> getMovieDetailFromDatabase(int movieId) {
    return Future.value(movieDao.getSingleMovie(movieId));
  }

  @override
  Future<List<MovieVO>> getNowPlayingMoviesFromDatabase() {
    return Future.value(movieDao
        .getAllMovies()
        .where((movie) => movie.isNowPlaying ?? true)
        .toList());
  }

  @override
  Future<List<MovieVO>> getPopularMoviesFromDatabase() {
    return Future.value(movieDao
        .getAllMovies()
        .where((movie) => movie.isPopular ?? true)
        .toList());
  }

  @override
  Future<List<MovieVO>> getTopRatedMoviesFromDatabase() {
    return Future.value(movieDao
        .getAllMovies()
        .where((movie) => movie.isTopRated ?? true)
        .toList());
  }
}
