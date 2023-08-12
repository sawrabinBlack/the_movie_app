import 'package:dots_indicator/dots_indicator.dart';
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
const List<String>_genreList =["genre1","genre2","gen3","gen4","gen5","gen6"];
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
          color: HOME_SCREEN_BACKGROUND_COLOR,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BannerSectionView(),
              const SizedBox(
                height: MARGIN_MEDIUM_2,
              ),
              BestPopularMovieAndSeriesSection(),
              const CheckMovieShowTimeSectionView(),
              const SizedBox(height: MARGIN_MEDIUM_2),
              GenreSectionView(_genreList),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TitleTextWithSeeMore(
                  titleText: "Showcases",
                  seeMoreText: "More Showcases",
                ),
              ),
              const SizedBox(height: MARGIN_MEDIUM_2),
              Container(
                height: 170,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: MARGIN_MEDIUM_2),
                  children: const [
                    ShowCaseView(),
                    ShowCaseView(),
                    ShowCaseView(),
                  ],
                ),
              ),
              const SizedBox(
                height: MARGIN_MEDIUM_2,
              ),
              const BestActorSectionView(),
              const SizedBox(
                height: MARGIN_MEDIUM_2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GenreSectionView extends StatelessWidget {
  final List<String> genreList;

  GenreSectionView(this.genreList);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
          child: DefaultTabController(length: genreList.length, child: TabBar(
              isScrollable: true,
              indicatorColor: Colors.amber,
              unselectedLabelColor: TITLE_TEXT_COLOR,
              tabs:
              genreList.map((genre) =>
                  Tab(
                    child: Text(genre),
                  ),).toList()

          )),
        ),
        SizedBox(height: MARGIN_MEDIUM,),
        Container(
            color: PRIMARY_COLOR,
            padding: EdgeInsets.only(
                top: MARGIN_MEDIUM_2, bottom: MARGIN_LARGE),
            child: const MovieListView()),
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

class BestActorSectionView extends StatelessWidget {
  const BestActorSectionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: TitleTextWithSeeMore(
            titleText: "Best Actor",
            seeMoreText: "More Actors",
          ),
        ),
        const SizedBox(
          height: MARGIN_MEDIUM_2,
        ),
        Container(
          height: 200,
          child: ListView(
              padding: const EdgeInsets.only(left: MARGIN_MEDIUM_2),
              scrollDirection: Axis.horizontal,
              children: [ActorView(), ActorView(), ActorView()]),
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
          margin: const EdgeInsets.only(left: MARGIN_MEDIUM_2),
          child: TitleText(bestMovieAndSeries),
        ),
        const SizedBox(
          height: MARGIN_MEDIUM_2,
        ),
        const MovieListView(),
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
        padding: const EdgeInsets.only(left: MARGIN_MEDIUM_2),
        itemBuilder: (BuildContext context, int index) {
          return const MovieView();
        },
        itemCount: 10,
      ),
    );
  }
}

class BannerSectionView extends StatefulWidget {
  const BannerSectionView({
    super.key,
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
        Container(
          height: MediaQuery
              .of(context)
              .size
              .height / 4,
          child: PageView(
            onPageChanged: (page) {
              setState(() {
                _position = page.toDouble();
              });
            },
            children: const [
              BannerView(),
              BannerView(),
            ],
          ),
        ),
        const SizedBox(
          height: MARGIN_MEDIUM,
        ),
        DotsIndicator(
          dotsCount: 2,
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
