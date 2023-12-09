import 'package:flutter/material.dart';

import '../resources/colors.dart';
import '../resources/dimens.dart';

class TitleText extends StatelessWidget {
  final String text;

  TitleText(this.text);

  @override
  Widget build(BuildContext context) {
    return  Text(
        text,
        style: TextStyle(
          color: Colors.white60,
          fontSize: TEXT_REGULAR,
          fontWeight: FontWeight.bold,
        ),
    );
  }
}
