import 'package:flutter/material.dart';
import 'package:movie_app/widgets/see_more.dart';
import 'package:movie_app/widgets/title_text.dart';

class TitleTextWithSeeMore extends StatelessWidget {
  final String titleText;
  final String seeMoreText;

  const TitleTextWithSeeMore({super.key, required this.titleText, required this.seeMoreText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TitleText(titleText),
        Spacer(),
        SeeMoreText(seeMoreText)
      ],
    );
  }
}
