

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/network/api_constants.dart';
import 'package:movie_app/network/the_movie_api.dart';

import 'movie_data_agent.dart';

class RetrofitDataAgentImpl extends MovieDataAgent {
  late TheMovieApi mApi;


  RetrofitDataAgentImpl(){
    final dio = Dio();
    mApi = TheMovieApi(dio);
  }

  @override
  void getNowPlayingMovies(int page) {
    mApi.getNowPlayingMovie(API_KEY, LANGUAGE_EN_US, page.toString()).then((value){
      debugPrint("Now Playing ======> ${value.toString()}");
    }).catchError((error) {
      debugPrint("Now Playing ======> ${error.toString()}");
    }
    );
  }

}
