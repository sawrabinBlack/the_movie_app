import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/data/models/movie_model_impl.dart';
import 'package:movie_app/data/vos/actor_vo.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/pages/movie_detail.dart';
import 'package:movie_app/resources/colors.dart';
import 'package:movie_app/resources/dimens.dart';
import 'package:movie_app/resources/strings.dart';
import 'package:movie_app/viewItems/actor_view.dart';
import 'package:movie_app/viewItems/banner_view.dart';
import 'package:movie_app/viewItems/movie_view.dart';
import 'package:movie_app/widgets/actors_and_create_section_view.dart';
import 'package:movie_app/widgets/see_more.dart';
import 'package:movie_app/widgets/title_text.dart';
import 'package:movie_app/widgets/title_text_with_see_more.dart';

import '../viewItems/show_case_view.dart';

const List<String> _genreList = [
  "genre1",
  "genre2",
  "gen3",
  "gen4",
  "gen5",
  "gen6"
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MovieVO>? nowPlayingMovies;
  List<MovieVO>? popularMovies;
  List<GenreVO>? genreList;
  List<MovieVO>? movieListByGenre;
  List<MovieVO>? topRatedMovies;
  List<ActorVO>? bestActors;
  MovieModel movieModel = MovieModelImpl();

  @override
  void initState() {
    movieModel.getNowPlayingMovies().then((movieList) => setState(() {
          nowPlayingMovies = movieList;
        }));
    movieModel.getPopularMovies().then((movieList) => setState(() {
          popularMovies = movieList?.take(5).toList();
        }));

    movieModel.getGenres().then((genreList) {
      setState(() {
        this.genreList = genreList;
      });
      _getMoviesByGenreId(genreList?.first.id ?? 0);
    });

    movieModel.getTopRatedMovies().then((movieList) => setState(() {
          topRatedMovies = movieList;
        }));
    movieModel.getBestActors().then((actorList) => setState(() {
          bestActors = actorList;
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,
        title: const Text(mainScreenAppBarTitle),
        leading: const Icon(
          Icons.menu,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(
                top: 0, left: 0, bottom: 0, right: MARGIN_MEDIUM_2),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: HOME_SCREEN_BACKGROUND_COLOR,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BannerSectionView(
                movieList: popularMovies,
              ),
              const SizedBox(
                height: MARGIN_MEDIUM_2,
              ),
              BestPopularMovieAndSeriesSection(
                  movieList: nowPlayingMovies,
                  onTapMovie: () => _navigateToMovieDetail(context, 2)),
              const CheckMovieShowTimeSectionView(),
              const SizedBox(height: MARGIN_MEDIUM_2),
              GenreSectionView(
                genreList: genreList ?? [],
                onTapGenre: _getMoviesByGenreId,
                onTapMovie: (movieId) {
                  if (movieId != null) {
                    _navigateToMovieDetail(context,movieId);
                  }
                },
                movieList: movieListByGenre,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TitleTextWithSeeMore(
                  "Showcases",
                  "More Showcases",
                ),
              ),
              const SizedBox(height: MARGIN_MEDIUM_2),
              Container(
                height: 170,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: MARGIN_MEDIUM_2),
                  children: topRatedMovies
                          ?.map((movie) => ShowCaseView(
                                movie: movie,
                              ))
                          .toList() ??
                      [],
                ),
              ),
              const SizedBox(
                height: MARGIN_MEDIUM_2,
              ),
              ActorsAndCreatorSectionView(
                title: "BEST ACTORS",
                seeMoreText: "MORE ACTORS",
                actorAndCreatorList: bestActors,
              ),
              const SizedBox(
                height: MARGIN_MEDIUM_2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getMoviesByGenreId(genreId) {
    movieModel.getMovieByGenre(genreId).then((movieList) => setState(() {
          movieListByGenre = movieList;
        }));
  }

  void _navigateToMovieDetail(BuildContext context, int movieId) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MovieDetailPage(
                  movieId: movieId,
                )));
  }
}

class GenreSectionView extends StatelessWidget {
  final List<GenreVO> genreList;
  final Function(int movieId) onTapMovie;
  final Function onTapGenre;
  final List<MovieVO>? movieList;

  GenreSectionView({
    required this.genreList,
    required this.onTapMovie,
    required this.onTapGenre(int genreId),
    this.movieList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
          child: DefaultTabController(
              length: genreList.length,
              child: TabBar(
                  onTap: (index) {
                    onTapGenre(genreList[index].id);
                  },
                  isScrollable: true,
                  indicatorColor: Colors.amber,
                  unselectedLabelColor: TITLE_TEXT_COLOR,
                  tabs: genreList
                      .map(
                        (genre) => Tab(
                          child: Text(genre?.name ?? ""),
                        ),
                      )
                      .toList())),
        ),
        SizedBox(
          height: MARGIN_MEDIUM,
        ),
        Container(
            color: PRIMARY_COLOR,
            padding:
                EdgeInsets.only(top: MARGIN_MEDIUM_2, bottom: MARGIN_LARGE),
            child: MovieListView(
              onTapMovie: (movieId) {
                onTapMovie(movieId);
              },
              movieList: movieList,
            )),
      ],
    );
  }
}

class CheckMovieShowTimeSectionView extends StatelessWidget {
  const CheckMovieShowTimeSectionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(MARGIN_LARGE),
      color: PRIMARY_COLOR,
      margin: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
      height: MOVIE_SHOW_TIME_SECTION,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                MAIN_SCREEN_CHECK_MOVIE_SHOW_TIME,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: TEXT_REGULAR_3X,
                    fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              SeeMoreText(
                "See More",
                textColor: Colors.amber,
              )
            ],
          ),
          const Spacer(),
          const Icon(
            Icons.location_on_rounded,
            size: playButton,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}

class BestPopularMovieAndSeriesSection extends StatelessWidget {
  final Function onTapMovie;
  final List<MovieVO>? movieList;

  BestPopularMovieAndSeriesSection(
      {required this.onTapMovie, required this.movieList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: MARGIN_MEDIUM_2),
          child: TitleText(bestMovieAndSeries),
        ),
        const SizedBox(
          height: MARGIN_MEDIUM_2,
        ),
        MovieListView(
          onTapMovie: (movieId) {
            onTapMovie(movieId);
          },
          movieList: movieList,
        ),
      ],
    );
  }
}

class MovieListView extends StatelessWidget {
  final Function(int movieId) onTapMovie;
  final List<MovieVO>? movieList;

  MovieListView({required this.onTapMovie, required this.movieList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: movieListHeight,
      child: movieList != null
          ? ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: MARGIN_MEDIUM_2),
              itemBuilder: (BuildContext context, int index) {
                return MovieView(
                  movie: movieList?[index],
                  onTapMovie: (movieId) {
                    onTapMovie(movieId);
                  },
                );
              },
              itemCount: movieList?.length ?? 0,
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

class BannerSectionView extends StatefulWidget {
  final List<MovieVO>? movieList;

  const BannerSectionView({
    super.key,
    this.movieList,
  });

  @override
  State<BannerSectionView> createState() => _BannerSectionViewState();
}

class _BannerSectionViewState extends State<BannerSectionView> {
  double _position = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 4,
          child: PageView(
            onPageChanged: (page) {
              setState(() {
                _position = page.toDouble();
              });
            },
            children: widget.movieList
                    ?.map((movie) => BannerView(
                          movie: movie,
                        ))
                    .toList() ??
                [],
          ),
        ),
        const SizedBox(
          height: MARGIN_MEDIUM,
        ),
        DotsIndicator(
          dotsCount: widget.movieList?.length ?? 1,
          position: _position,
          decorator: const DotsDecorator(
            color: HOME_SCREEN_BANNER_DOTS_INACTIVE_COLOR,
            activeColor: Colors.amber,
          ),
        )
      ],
    );
  }
}
