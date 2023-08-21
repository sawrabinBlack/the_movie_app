import 'package:dio/dio.dart';
import 'package:movie_app/network/api_constants.dart';
import 'package:movie_app/network/responses/get_actor_response.dart';
import 'package:movie_app/network/responses/get_genre_response.dart';
import 'package:movie_app/network/responses/get_now_playing_response.dart';
import 'package:retrofit/http.dart';

part 'the_movie_api.g.dart';

@RestApi(baseUrl: BASE_URL_DIO)
abstract class TheMovieApi {
  factory TheMovieApi(Dio dio) = _TheMovieApi;

  @GET(ENDPOINT_NOW_PLAYING)
  Future<GetNowPlayingResponse> getNowPlayingMovie(
    @Query(PARAM_API_KEY) String apiKey,
    @Query(PARAM_LANGUAGE) String language,
    @Query(PARAM_PAGE) String page,
  );

  @GET(ENDPOINT_POPULAR_MOVIES)
  Future<GetNowPlayingResponse> getPopularMovies(
    @Query(PARAM_API_KEY) String apiKey,
    @Query(PARAM_LANGUAGE) String language,
  );

  @GET(ENDPOINT_GENRES)
  Future<GetGenreResponse> getGenre(
    @Query(PARAM_API_KEY) String apiKey,
  );

  @GET(ENDPOINT_MOVIES_BY_GENRE)
  Future<GetNowPlayingResponse> getMoviesByGenre(
    @Query(PARAM_API_KEY) String apiKey,
    @Query(PARAM_WITH_GENRES) String withGenres,
  );

  @GET(ENDPOINT_GET_TOP_RATED)
  Future<GetNowPlayingResponse> getTopRatedMovies(
    @Query(PARAM_API_KEY) String apiKey,
  );

  @GET(ENDPOINT_BEST_ACTORS)
  Future<GetActorResponse> getBestActors(
      @Query(PARAM_API_KEY) String apiKey,
      );
}
