import 'package:flutter/material.dart';

class MovieView extends StatelessWidget {
  const MovieView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.network(
            "https://assetsio.reedpopcdn.com/319879966_1219712415559369_2430883062931850206_n.jpg?width=1200&height=1200&fit=bounds&quality=70&format=jpg&auto=webp",
            height: 200,
            fit: BoxFit.cover,
          ),
          Text("West World")
        ],
      ),
    );
  }
}
