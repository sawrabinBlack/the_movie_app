import 'package:flutter/material.dart';
import 'package:movie_app/resources/colors.dart';
import 'package:movie_app/resources/dimens.dart';
import 'package:movie_app/widgets/gradient_view.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: PRIMARY_COLOR,
        child: CustomScrollView(
          slivers: [MovieDetailSliverAppBarView()],
        ),
      ),
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
        Row(children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
            height: MARGIN_XLARGE,
            decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(MARGIN_MEDIUM_2)
            ),
            child: Center(
                child: Text("2016",style: TextStyle(color: Colors.white),),),
          )
        ],),
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
