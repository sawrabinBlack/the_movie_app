import 'package:flutter/material.dart';
import 'package:movie_app/resources/colors.dart';
import 'package:movie_app/resources/dimens.dart';
import 'package:movie_app/widgets/actors_and_create_section_view.dart';
import 'package:movie_app/widgets/gradient_view.dart';
import 'package:movie_app/widgets/rating_view.dart';
import 'package:movie_app/widgets/title_text.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({super.key});

  static const List<String> genreList = ["Action", "Comedy", "Sci-fi"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: PRIMARY_COLOR,
        child: CustomScrollView(
          slivers: [
            MovieDetailSliverAppBarView(),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                  child: TrailerSection(
                    genreList: genreList,
                  ),
                ),
                ActorsAndCreatorSectionView(
                  "ACTORS",
                  "",
                  seeMoreButtonVisible: false,
                ),
                ActorsAndCreatorSectionView("CREATOR", "MORE CREATORS")
              ]),
            )
          ],
        ),
      ),
    );
  }
}

class TrailerSection extends StatelessWidget {
  final List<String> genreList;

  const TrailerSection({
    super.key,
    required this.genreList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MovieTimeAndGenreView(genreList: genreList),
        SizedBox(
          height: MARGIN_MEDIUM_3,
        ),
        StoryLineView(),
        SizedBox(height:MARGIN_MEDIUM_2,),
        Container(
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: MARGIN_CARD_MEDIUM_2),
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(MARGIN_LARGE),
          ),
          child: Center(
            widthFactor: 2,
            child: Wrap(
              direction: Axis.horizontal,
              children: [
                Text("Play Trailer",style: TextStyle(
                  color: Colors.white
                ),),
              ],
            ),
          ),
        )

      ],
    );
  }
}

class StoryLineView extends StatelessWidget {
  const StoryLineView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText("STORY LINE"),
        SizedBox(
          height: MARGIN_MEDIUM,
        ),
        Text(
          "Following the Normandy Landings, a group of U.S. soldiers go behind enemy lines to retrieve a paratrooper whose brothers have been killed in action.",
          style: TextStyle(color: Colors.white, fontSize: TEXT_REGULAR_2X),
        ),
      ],
    );
  }
}

class MovieTimeAndGenreView extends StatelessWidget {
  const MovieTimeAndGenreView({
    super.key,
    required this.genreList,
  });

  final List<String> genreList;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Icon(
          Icons.access_time,
          color: Colors.amber,
        ),
        SizedBox(
          width: MARGIN_SMALL,
        ),
        Text(
          "2 h 30 min",
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(
          width: MARGIN_MEDIUM,
        ),
        ...genreList.map((genre) => GenreChipView(genreText: genre)).toList(),
        Icon(
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
      children: [
        Chip(
          backgroundColor: MOVIE_DETAIL_SCREEN_CHIP_BACKGROUND,
          label: Text(
            genreText,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: MARGIN_SMALL,
        )
      ],
    );
  }
}

class MovieDetailSliverAppBarView extends StatelessWidget {
  const MovieDetailSliverAppBarView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: PRIMARY_COLOR,
      expandedHeight: MOVIE_DETAIL_SLIVER_APP_BAR_EXPAND_HEIGHT,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Positioned.fill(
              child: MovieDetailAppBarImageView(),
            ),
            Positioned.fill(
              child: GradientView(),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding:
                    EdgeInsets.only(top: MARGIN_XXLARGE, left: MARGIN_MEDIUM_2),
                child: BackButtonView(),
              ),
            ),
            Align(
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
                child: MovieDetailAppBarInfoView(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MovieDetailAppBarInfoView extends StatelessWidget {
  const MovieDetailAppBarInfoView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            MovieDetailYearView(),
            Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    RatingView(),
                    SizedBox(
                      height: MARGIN_SMALL,
                    ),
                    TitleText("38876 Votes"),
                    SizedBox(
                      height: MARGIN_CARD_MEDIUM_2,
                    )
                  ],
                ),
                SizedBox(
                  width: MARGIN_MEDIUM,
                ),
                Text(
                  "9,76",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MOVIE_DETAIL_RATING_TEXT_SIZE),
                ),
                SizedBox(
                  height: MARGIN_MEDIUM_2,
                )
              ],
            )
          ],
        ),
        Text(
          "Saving Private Ryan",
          style: TextStyle(
              color: Colors.white,
              fontSize: TEXT_HEADING_1X,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class MovieDetailYearView extends StatelessWidget {
  const MovieDetailYearView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
      height: MARGIN_XLARGE,
      decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(MARGIN_MEDIUM_2)),
      child: Center(
        child: Text(
          "2016",
          style: TextStyle(color: Colors.white),
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
    return Icon(
      Icons.search,
      color: Colors.white,
    );
  }
}

class BackButtonView extends StatelessWidget {
  const BackButtonView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black54),
      child: Icon(
        Icons.chevron_left,
        color: Colors.white,
      ),
    );
  }
}

class MovieDetailAppBarImageView extends StatelessWidget {
  const MovieDetailAppBarImageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://m.media-amazon.com/images/M/MV5BZjhkMDM4MWItZTVjOC00ZDRhLThmYTAtM2I5NzBmNmNlMzI1XkEyXkFqcGdeQXVyNDYyMDk5MTU@._V1_FMjpg_UX1000_.jpg",
      fit: BoxFit.cover,
    );
  }
}
