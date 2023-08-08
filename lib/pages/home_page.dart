import 'package:flutter/material.dart';
import 'package:movie_app/resources/colors.dart';
import 'package:movie_app/resources/dimens.dart';
import 'package:movie_app/resources/strings.dart';
import 'package:movie_app/viewItems/actor_view.dart';
import 'package:movie_app/viewItems/banner_view.dart';
import 'package:movie_app/viewItems/movie_view.dart';
import 'package:movie_app/widgets/see_more.dart';
import 'package:movie_app/widgets/title_text.dart';
import 'package:movie_app/widgets/title_text_with_see_more.dart';

import '../viewItems/show_case_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
          color: PRIMARY_COLOR,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BannerSectionView(),
              SizedBox(
                height: MARGIN_MEDIUM_2,
              ),
              BestPopularMovieAndSeriesSection(),
              SizedBox(
                height: MARGIN_MEDIUM_2,
              ),
              MovieListView(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TitleTextWithSeeMore(
                  titleText: "Showcases",
                  seeMoreText: "More Showcases",
                ),
              ),
              SizedBox(
                height: MARGIN_MEDIUM_2,
              ),
              Container(
                height: 170,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
                  children: [
                    ShowCaseView(),
                    ShowCaseView(),
                    ShowCaseView(),
                  ],
                ),
              ),
              SizedBox(
                height: MARGIN_MEDIUM_2,
              ),
              BestActorSectionView(),
              SizedBox(
                height: MARGIN_MEDIUM_2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BestActorSectionView extends StatelessWidget {
  const BestActorSectionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TitleTextWithSeeMore(
            titleText: "Best Actor",
            seeMoreText: "More Actors",
          ),
        ),
        SizedBox(
          height: MARGIN_MEDIUM_2,
        ),
        Container(
          height: 200,
          child: ListView(
            padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
            scrollDirection: Axis.horizontal,
            children: [
              ActorView(),
              ActorView(),
              ActorView()
            ]
          ),
        ),
      ],
    );
  }
}

class BestPopularMovieAndSeriesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: MARGIN_MEDIUM_2),
          child: TitleText(bestMovieAndSeries),
        ),
        SizedBox(
          height: MARGIN_MEDIUM_2,
        ),
        MovieListView(),
      ],
    );
  }
}

class MovieListView extends StatelessWidget {
  const MovieListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: movieListHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
        itemBuilder: (BuildContext context, int index) {
          return MovieView();
        },
        itemCount: 10,
      ),
    );
  }
}

class BannerSectionView extends StatelessWidget {
  const BannerSectionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      child: PageView(
        children: const [
          BannerView(),
          BannerView(),
        ],
      ),
    );
  }
}
