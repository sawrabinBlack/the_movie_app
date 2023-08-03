import 'package:flutter/material.dart';
import 'package:movie_app/resources/colors.dart';
import 'package:movie_app/resources/dimens.dart';

import '../widgets/play_button_view.dart';

class BannerView extends StatelessWidget {
  const BannerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: BannerImageView(),
        ),
        Positioned.fill(
          child: GradientView(),
        ),
        Align(
          alignment: AlignmentDirectional.bottomStart,
          child: BannerSectionView(),
        ),
        Align(
          alignment: AlignmentDirectional.center,
          child: PlayButtonView(),
        )
      ],
    );
  }
}



class GradientView extends StatelessWidget {
  const GradientView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.transparent, PRIMARY_COLOR],
        ),
      ),
    );
  }
}

class BannerImageView extends StatelessWidget {
  const BannerImageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://assetsio.reedpopcdn.com/319879966_1219712415559369_2430883062931850206_n.jpg?width=1920&height=1920&fit=bounds&quality=80&format=jpg&auto=webp",
      fit: BoxFit.cover,
    );
  }
}

class BannerSectionView extends StatelessWidget {
  const BannerSectionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(MARGIN_MEDIUM_2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "The Wolverine 2013",
            style: TextStyle(
              color: Colors.white,
              fontSize: textHeading1x,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            'Official Review',
            style: TextStyle(
              color: Colors.white,
              fontSize: textHeading1x,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
