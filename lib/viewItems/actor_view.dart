import 'package:flutter/material.dart';
import 'package:movie_app/data/vos/actor_vo.dart';
import 'package:movie_app/network/api_constants.dart';

import '../resources/dimens.dart';

class ActorView extends StatelessWidget {
  final ActorVO actorAndCreator;

  const ActorView({super.key, required this.actorAndCreator});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      width: movieListWidth,
      margin: EdgeInsets.only(left: MARGIN_MEDIUM),
      child: Stack(
        children: [
          Positioned.fill(
            child: ActorImageView(
              actorImageLink: actorAndCreator.profilePath,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topRight,
              child: FavoriteButtonView(),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ActorNameAndLikedView(
              name: actorAndCreator.name ?? "",
            ),
          )
        ],
      ),
    );
  }
}

class ActorImageView extends StatelessWidget {
  final String? actorImageLink;

  const ActorImageView({
    super.key,
    required this.actorImageLink,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "$IMAGE_BASE_URL$actorImageLink",
      fit: BoxFit.cover,
    );
  }
}

class FavoriteButtonView extends StatelessWidget {
  const FavoriteButtonView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.favorite_outline,
      color: Colors.white,
    );
  }
}

class ActorNameAndLikedView extends StatelessWidget {
  final String name;

  const ActorNameAndLikedView({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: MARGIN_MEDIUM, vertical: MARGIN_MEDIUM_2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            name,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
          ),
          Row(
            children: [
              Icon(
                Icons.thumb_up,
                color: Colors.amber,
                size: MARGIN_MEDIUM_2,
              ),
              SizedBox(
                width: MARGIN_MEDIUM,
              ),
              Text(
                "You Like 3 Movies",
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}
