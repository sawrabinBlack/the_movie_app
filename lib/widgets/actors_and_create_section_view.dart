import 'package:flutter/material.dart';
import 'package:movie_app/data/vos/actor_vo.dart';
import 'package:movie_app/widgets/title_text_with_see_more.dart';

import '../resources/dimens.dart';
import '../viewItems/actor_view.dart';

class ActorsAndCreatorSectionView extends StatelessWidget {
  final String title;
  final String seeMoreText;
  final bool seeMoreButtonVisible;
  final List<ActorVO>? actorAndCreatorList;

  ActorsAndCreatorSectionView(
      {required this.title,
      required this.seeMoreText,
      this.seeMoreButtonVisible = true,
      required this.actorAndCreatorList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: MARGIN_MEDIUM_2),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: TitleTextWithSeeMore(
              title,
              seeMoreText,
              seeMoreButtonVisibility: seeMoreButtonVisible,
            ),
          ),
          SizedBox(
            height: MARGIN_MEDIUM_2,
          ),
          Container(
            height: 200,
            child: ListView(
              padding: const EdgeInsets.only(left: MARGIN_MEDIUM_2),
              scrollDirection: Axis.horizontal,
              children: actorAndCreatorList
                      ?.map((actorAndCreator) =>
                          ActorView(actorAndCreator: actorAndCreator))
                      .toList() ??
                  [],
            ),
          ),
        ],
      ),
    );
  }
}
