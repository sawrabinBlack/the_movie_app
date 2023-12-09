import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/data/vos/actor_vo.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/network/api_constants.dart';
import 'package:movie_app/network/the_movie_api.dart';

import 'movie_data_agent.dart';

class RetrofitDataAgentImpl extends MovieDataAgent {
  late TheMovieApi mApi;

  static RetrofitDataAgentImpl _singleton = RetrofitDataAgentImpl._internal();

  ///factory Constructor
  factory RetrofitDataAgentImpl() {
    return _singleton;
  }

  ///private name constructor
  RetrofitDataAgentImpl._internal() {
    final dio = Dio();
    mApi = TheMovieApi(dio);
  }

  @override
  Future<List<MovieVO>> getNowPlayingMovies(int page) {
    return mApi
        .getNowPlayingMovie(API_KEY, LANGUAGE_EN_US, page.toString())
        .asStream()
        .map((response) => response.results??[])
        .first;
  }

  @override
  Future<List<MovieVO>> getPopularMovies() {
    return mApi
        .getPopularMovies(API_KEY, LANGUAGE_EN_US)
        .asStream()
        .map((response) => response.results??[])
        .first;
  }

  @override
  Future<List<GenreVO>> getGenres() {
    return mApi
        .getGenre(API_KEY)
        .asStream()
        .map((response) => response.genres??[])
        .first;
  }

  @override
  Future<List<MovieVO>> getMovieByGenre(int genreId) {
    return mApi
        .getMoviesByGenre(API_KEY, genreId.toString())
        .asStream()
        .map((response) => response.results??[])
        .first;
  }

  @override
  Future<List<MovieVO>> getTopRatedMovies() {
    return mApi
        .getTopRatedMovies(API_KEY)
        .asStream()
        .map((response) => response.results??[])
        .first;
  }

  @override
  Future<List<ActorVO>> getBestActors() {
    return mApi
        .getBestActors(API_KEY)
        .asStream()
        .map((response) => response.results??[])
        .first;
  }

  @override
  Future<List<List<ActorVO>>> getCreditsByMovies(int movieId) {
    return mApi
        .getMovieCredits(movieId.toString(), API_KEY)
        .asStream()
        .map((response) {
      return [response.cast??[], response.crew??[]];
    }).first;
  }

  @override
  Future<MovieVO> getMovieDetails(int movieId) {
    return mApi.getMovieDetails(movieId.toString(), API_KEY);
  }
}
