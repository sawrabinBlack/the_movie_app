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
          color: TITLE_TEXT_COLOR,
          fontSize: textRegular,
          fontWeight: FontWeight.bold,
        ),
    );
  }
}
