import 'package:flutter/widgets.dart';
import 'package:movie_app/network/api_constants.dart';
import 'package:movie_app/network/movie_data_agent.dart';
import 'package:http/http.dart' as http;

// class HttpMovieDataAgentImpl extends MovieDataAgent{
//   // @override
//   // void getNowPlayingMovies(int page) {
//   //   Map<String,String> queryParameters = {
//   //     PARAM_API_KEY : API_KEY,
//   //     PARAM_LANGUAGE : LANGUAGE_EN_US,
//   //     PARAM_PAGE : page.toString()
//   //   };
//   //
//   //
//   //   var uri = Uri.https(BASE_URL,ENDPOINT_NOW_PLAYING,queryParameters);
//   //   http.get(uri).then((value){
//   //     debugPrint("Now Playing ======> ${value.body.toString()}");
//   //   }).catchError((error) {
//   //     debugPrint("Now Playing ======> ${error.toString()}");
//   //   }
//   //   );
//   // }
//
// }