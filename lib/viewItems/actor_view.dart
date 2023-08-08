import 'package:flutter/material.dart';

import '../resources/dimens.dart';

class ActorView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      width: movieListWidth,
      margin: EdgeInsets.only(left: margin_medium),
      child: Stack(
        children: [
          Positioned.fill(
            child: ActorImageView(),
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
            child: ActorNameAndLikedView(),
          )
        ],
      ),
    );
  }
}

class ActorImageView extends StatelessWidget {
  const ActorImageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://image.pmgstatic.com/cache/resized/w200h264crop/files/images/creator/photos/167/116/167116499_c46e5b.jpg",
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
  const ActorNameAndLikedView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: margin_medium, vertical: MARGIN_MEDIUM_2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Cillian Murphy",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700),
          ),
          Row(
            children: [
              Icon(
                Icons.thumb_up,
                color: Colors.amber,
                size: MARGIN_MEDIUM_2,
              ),
              SizedBox(width: margin_medium,),
              Text("You Like 3 Movies",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
            ],
          )
        ],
      ),
    );
  }
}
