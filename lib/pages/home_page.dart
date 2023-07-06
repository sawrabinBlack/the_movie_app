import 'package:flutter/material.dart';
import 'package:movie_app/resources/colors.dart';
import 'package:movie_app/resources/dimens.dart';
import 'package:movie_app/resources/strings.dart';
import 'package:movie_app/viewItems/banner_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,
        title: const Text(MAIN_SCREEN_APPBAR_Title),
        centerTitle: true,
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
      body: Container(
        color: PRIMARY_COLOR,
        child: Column(
          children: [
            BannerSectionView(),
          ],
        ),
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
      height: MediaQuery.of(context).size.height/4,
      child: PageView(
        children: [
          BannerView(),
          BannerView(),
          BannerView()],
      ),
    );
  }
}
