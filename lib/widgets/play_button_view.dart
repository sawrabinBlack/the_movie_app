import 'package:flutter/material.dart';

import '../resources/dimens.dart';

class PlayButtonView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.play_circle_fill,
      size: playButton,
      color: Colors.amber,
    );
  }
}