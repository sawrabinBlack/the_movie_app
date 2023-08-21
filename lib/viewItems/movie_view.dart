import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app/network/api_constants.dart';
import 'package:movie_app/widgets/rating_view.dart';

import '../data/vos/movie_vo.dart';
import '../resources/dimens.dart';

class MovieView extends StatelessWidget {
  final MovieVO? movie;
final Function(int movieId) onTapMovie;
  const MovieView({super.key, required this.movie, required this.onTapMovie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTapMovie(movie?.id??0);
      },
      child: Container(
        width: movieListWidth,
        margin: const EdgeInsets.only(right: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              "$IMAGE_BASE_URL${movie?.posterPath}",
              fit: BoxFit.fill,
              height: 200,
            ),
            SizedBox(height: MARGIN_MEDIUM),
            Text(
              movie?.title ?? "",
              maxLines: 3,
              style: const TextStyle(
                color: Colors.white,
                fontSize: TEXT_REGULAR_2X,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: MARGIN_MEDIUM,
            ),
            Row(
              children: [
                Text(
                  "${movie?.voteAverage}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: TEXT_REGULAR_2X,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: MARGIN_MEDIUM,
                ),
                RatingView(
                  rating: movie?.voteAverage ?? 0.0,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
