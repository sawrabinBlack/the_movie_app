import 'package:flutter/material.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/network/api_constants.dart';
import 'package:movie_app/resources/colors.dart';
import 'package:movie_app/resources/dimens.dart';

import '../widgets/gradient_view.dart';
import '../widgets/play_button_view.dart';

class BannerView extends StatelessWidget {
  final MovieVO? movie;

  const BannerView({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: BannerImageView(
            imageLink: movie?.posterPath ?? "",
          ),
        ),
        Positioned.fill(
          child: GradientView(),
        ),
        Align(
          alignment: AlignmentDirectional.bottomStart,
          child: BannerSectionView(titleText: movie?.title??"",),
        ),
        Align(
          alignment: AlignmentDirectional.center,
          child: PlayButtonView(),
        )
      ],
    );
  }
}

class BannerImageView extends StatelessWidget {
  final String imageLink;

  const BannerImageView({
    super.key,
    required this.imageLink,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "$IMAGE_BASE_URL$imageLink",
      fit: BoxFit.cover,
    );
  }
}

class BannerSectionView extends StatelessWidget {
  final String titleText;
  const BannerSectionView({
    super.key, required this.titleText,
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
            titleText,
            style: TextStyle(
              color: Colors.white,
              fontSize: TEXT_HEADING_1X,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            'Official Review',
            style: TextStyle(
              color: Colors.white,
              fontSize: TEXT_HEADING_1X,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
