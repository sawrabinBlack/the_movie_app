import 'package:flutter/material.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/network/api_constants.dart';
import 'package:movie_app/resources/dimens.dart';
import 'package:movie_app/widgets/play_button_view.dart';
import 'package:movie_app/widgets/title_text.dart';

class ShowCaseView extends StatelessWidget {
  final MovieVO movie;

  const ShowCaseView({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: MARGIN_MEDIUM),
      width: 300,
      color: Colors.blue,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              "$IMAGE_BASE_URL${movie.posterPath}",
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: PlayButtonView(),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    movie.title??"",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: TEXT_REGULAR_2X,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: MARGIN_MEDIUM,
                  ),
                  TitleText("${movie.releaseDate}")
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
