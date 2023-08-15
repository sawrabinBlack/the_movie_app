import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app/widgets/rating_view.dart';

import '../resources/dimens.dart';

class MovieView extends StatelessWidget {
  const MovieView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: movieListWidth,
      margin: EdgeInsets.only(right: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            "https://assetsio.reedpopcdn.com/319879966_1219712415559369_2430883062931850206_n.jpg?width=1920&height=1920&fit=bounds&quality=80&format=jpg&auto=webp",
            fit: BoxFit.cover,
            height: 150,
          ),
          SizedBox(height: MARGIN_MEDIUM),
          Text(
            "West World",
            style: TextStyle(
                color: Colors.white,
                fontSize: TEXT_REGULAR_2X,
                fontWeight: FontWeight.w500),
          ),
          Row(
            children: [
              Text(
                "8.9",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: TEXT_REGULAR_2X,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(width: MARGIN_MEDIUM,),
              RatingView(),
            ],
          )
        ],
      ),
    );
  }
}
