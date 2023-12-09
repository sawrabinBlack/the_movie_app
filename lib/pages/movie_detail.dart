import 'package:flutter/material.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/data/models/movie_model_impl.dart';
import 'package:movie_app/data/vos/actor_vo.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/network/api_constants.dart';
import 'package:movie_app/resources/colors.dart';
import 'package:movie_app/resources/dimens.dart';
import 'package:movie_app/widgets/actors_and_create_section_view.dart';
import 'package:movie_app/widgets/gradient_view.dart';
import 'package:movie_app/widgets/rating_view.dart';
import 'package:movie_app/widgets/title_text.dart';
class MovieDetailPage extends StatefulWidget {
  static const List<String> genreList = ["Action", "Comedy", "Sci-fi"];
  final int movieId;

  const MovieDetailPage({super.key, required this.movieId});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  MovieModel movieModel = MovieModelImpl();
  List<ActorVO>? actors;
  List<ActorVO>? creators;
  MovieVO? movieVO;

  @override
  void initState() {
    movieModel.getMovieDetail(widget.movieId).then((movie) => setState(() {
          movieVO = movie;
        }));
    movieModel.getMovieDetailFromDatabase(widget.movieId).then((movie) => setState(() {
          movieVO = movie;
        }));
    movieModel
        .getCreditsByMovies(widget.movieId)
        .then((credits) => setState(() {
              actors = credits.first;
              creators = credits[1];
            }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: PRIMARY_COLOR,
        child: CustomScrollView(
          slivers: [
            MovieDetailSliverAppBarView(() {
              Navigator.pop(context);
            }, movieVO),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                  child: TrailerSection(
                    genreList: movieVO?.getGenreListAsStringList() ?? [],
                    movieDuration: movieVO?.runTime,
                    storyLine: movieVO?.overview ?? "",
                  ),
                ),
                const SizedBox(height: MARGIN_MEDIUM_2),
                ActorsAndCreatorSectionView(
                  title: "ACTORS",
                  seeMoreText: "",
                  seeMoreButtonVisible: false,
                  actorAndCreatorList: actors,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                  child: AboutFilmSectionView(
                    movieDetail: movieVO,
                  ),
                ),
                ActorsAndCreatorSectionView(
                  title: "CREATOR",
                  seeMoreText: "MORE CREATORS",
                  actorAndCreatorList: creators,
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}

class AboutFilmSectionView extends StatelessWidget {
  final MovieVO? movieDetail;

  const AboutFilmSectionView({
    super.key,
    this.movieDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText("ABOUT FILM"),
        const SizedBox(height: MARGIN_MEDIUM_2),
        AboutInfoItemView("Original Title", movieDetail?.originalTitle ?? ""),
        const SizedBox(height: MARGIN_MEDIUM_2),
        AboutInfoItemView(
            "Type", movieDetail?.getGenreWithCommaSeperate() ?? ""),
        const SizedBox(height: MARGIN_MEDIUM_2),
        AboutInfoItemView("Production",
            movieDetail?.getProductionCountryWithCommaSeperate() ?? ""),
        const SizedBox(height: MARGIN_MEDIUM_2),
        AboutInfoItemView("Premiere", movieDetail?.releaseDate ?? ""),
        const SizedBox(height: MARGIN_MEDIUM_2),
        AboutInfoItemView("Description", movieDetail?.overview ?? ""),
        const SizedBox(height: MARGIN_MEDIUM_2),
      ],
    );
  }
}

class AboutInfoItemView extends StatelessWidget {
  final String label;
  final String description;

  AboutInfoItemView(this.label, this.description);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 4,
          child: Text(
            label,
            style: const TextStyle(
                color: MOVIE_DETAIL_INFO_TEXT_COLOR,
                fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          width: MARGIN_MEDIUM_2,
        ),
        Expanded(
          child: Text(
            description,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}

class TrailerSection extends StatelessWidget {
  final List<String> genreList;
  final int? movieDuration;
  final String storyLine;

  const TrailerSection({
    super.key,
    required this.genreList,
    required this.movieDuration,
    required this.storyLine,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MovieTimeAndGenreView(
          genreList: genreList,
          movieDuration: movieDuration,
        ),
        const SizedBox(
          height: MARGIN_MEDIUM_3,
        ),
        StoryLineView(
          storyLine: storyLine,
        ),
        const SizedBox(
          height: MARGIN_MEDIUM_2,
        ),
        Wrap(
          direction: Axis.horizontal,
          children: [
            MovieDetailRoundedButtonView(
              "PLAY TRAILER",
              const Icon(Icons.play_circle_fill),
              Colors.amber,
            ),
            const SizedBox(width: MARGIN_MEDIUM),
            MovieDetailRoundedButtonView(
              "RATE MOVIE",
              const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              HOME_SCREEN_BACKGROUND_COLOR,
              isGhostButton: true,
            ),
          ],
        ),
      ],
    );
  }
}

class MovieDetailRoundedButtonView extends StatelessWidget {
  final String buttonText;
  final Icon buttonIcon;
  final Color backgroundColor;
  bool isGhostButton;

  MovieDetailRoundedButtonView(
      this.buttonText, this.buttonIcon, this.backgroundColor,
      {this.isGhostButton = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: MARGIN_CARD_MEDIUM_2),
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(MARGIN_LARGE),
          border:
              isGhostButton ? Border.all(color: Colors.white, width: 2) : null),
      child: Center(
        widthFactor: 1,
        child: Wrap(
          direction: Axis.horizontal,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            buttonIcon,
            const SizedBox(
              width: MARGIN_MEDIUM,
            ),
            Text(
              buttonText,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class StoryLineView extends StatelessWidget {
  final String storyLine;

  const StoryLineView({
    super.key,
    required this.storyLine,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText("STORY LINE"),
        const SizedBox(height: MARGIN_MEDIUM),
        Text(
          storyLine,
          style:
              const TextStyle(color: Colors.white, fontSize: TEXT_REGULAR_2X),
        ),
      ],
    );
  }
}

class MovieTimeAndGenreView extends StatelessWidget {
  const MovieTimeAndGenreView({
    super.key,
    required this.genreList,
    required this.movieDuration,
  });

  final List<String> genreList;
  final int? movieDuration;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        const Icon(
          Icons.access_time,
          color: Colors.amber,
        ),
        const SizedBox(
          width: MARGIN_SMALL,
        ),
        Text(
          "${movieDuration ?? 0} min",
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(
          width: MARGIN_MEDIUM,
        ),
        ...genreList.map((genre) => GenreChipView(genreText: genre)).toList(),
        const Icon(
          Icons.favorite_border,
          color: Colors.white,
        )
      ],
    );
  }
}

class GenreChipView extends StatelessWidget {
  final String genreText;

  const GenreChipView({
    super.key,
    required this.genreText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Chip(
          backgroundColor: MOVIE_DETAIL_SCREEN_CHIP_BACKGROUND,
          label: Text(
            genreText,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          width: MARGIN_SMALL,
        )
      ],
    );
  }
}

class MovieDetailSliverAppBarView extends StatelessWidget {
  final Function onTapBackButtonView;
  final MovieVO? movieDetail;

  MovieDetailSliverAppBarView(this.onTapBackButtonView, this.movieDetail);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: PRIMARY_COLOR,
      expandedHeight: MOVIE_DETAIL_SLIVER_APP_BAR_EXPAND_HEIGHT,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Positioned.fill(
              child: MovieDetailAppBarImageView(
                image: movieDetail?.posterPath ?? "",
              ),
            ),
            const Positioned.fill(
              child: GradientView(),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: MARGIN_XXLARGE, left: MARGIN_MEDIUM_2),
                child: BackButtonView(() {
                  onTapBackButtonView();
                }),
              ),
            ),
            const Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(
                    top: MARGIN_XXLARGE + MARGIN_MEDIUM,
                    right: MARGIN_MEDIUM_2),
                child: SearchButtonView(),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: MARGIN_MEDIUM_2,
                    right: MARGIN_MEDIUM_2,
                    bottom: MARGIN_LARGE),
                child: MovieDetailAppBarInfoView(
                  movieDetail: movieDetail,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MovieDetailAppBarInfoView extends StatelessWidget {
  final MovieVO? movieDetail;

  const MovieDetailAppBarInfoView({
    super.key,
    required this.movieDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            MovieDetailYearView(
              year: movieDetail?.releaseDate?.substring(0, 4) ?? "",
            ),
            const Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    RatingView(
                      rating: movieDetail?.voteAverage ?? 0,
                    ),
                    const SizedBox(height: MARGIN_SMALL),
                    TitleText("${movieDetail?.voteCount ?? 0} Votes"),
                    const SizedBox(height: MARGIN_CARD_MEDIUM_2)
                  ],
                ),
                const SizedBox(width: MARGIN_MEDIUM),
                Text(
                  "${movieDetail?.voteAverage ?? 0}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: MOVIE_DETAIL_RATING_TEXT_SIZE),
                ),
                const SizedBox(height: MARGIN_MEDIUM_2)
              ],
            )
          ],
        ),
        Text(
          movieDetail?.title ?? "",
          style: const TextStyle(
              color: Colors.white,
              fontSize: TEXT_HEADING_1X,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class MovieDetailYearView extends StatelessWidget {
  final String year;

  const MovieDetailYearView({
    super.key,
    required this.year,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
      height: MARGIN_XLARGE,
      decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(MARGIN_MEDIUM_2)),
      child: Center(
        child: Text(
          year,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class SearchButtonView extends StatelessWidget {
  const SearchButtonView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.search,
      color: Colors.white,
    );
  }
}

class BackButtonView extends StatelessWidget {
  final Function onTapBackButton;

  BackButtonView(this.onTapBackButton);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapBackButton();
      },
      child: Container(
        width: 32,
        height: 32,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.black54),
        child: const Icon(
          Icons.chevron_left,
          color: Colors.white,
        ),
      ),
    );
  }
}

class MovieDetailAppBarImageView extends StatelessWidget {
  final String image;

  const MovieDetailAppBarImageView({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "$IMAGE_BASE_URL$image",
      fit: BoxFit.cover,
    );
  }
}
