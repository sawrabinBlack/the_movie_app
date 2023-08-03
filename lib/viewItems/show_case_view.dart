import 'package:flutter/material.dart';
import 'package:movie_app/resources/dimens.dart';
import 'package:movie_app/widgets/play_button_view.dart';
import 'package:movie_app/widgets/title_text.dart';

class ShowCaseView extends StatelessWidget {
  const ShowCaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: margin_medium),
      width: 300,
      color: Colors.blue,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              "https://assetsio.reedpopcdn.com/319879966_1219712415559369_2430883062931850206_n.jpg?width=1920&height=1920&fit=bounds&quality=80&format=jpg&auto=webp",
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
                    "Passenger",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: textRegular2x,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: margin_medium,),
                  TitleText("15 December 2016")
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
