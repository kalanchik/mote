import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mote_app/models/meets_models.dart';
import 'package:mote_app/router/router.dart';
import 'package:mote_app/screens/main_screens/meets_screen/widgets/meets_card.dart';
import 'package:mote_app/screens/main_screens/meets_screen/widgets/meets_search.dart';

class MyMeetsContent extends StatelessWidget {
  final List<MeetsModels> myMeets;
  const MyMeetsContent({super.key, required this.myMeets});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MeetsSearch(),
        const SizedBox(
          height: 15,
        ),
        ...List<Widget>.generate(
          myMeets.length,
          (index) => MeetsCard(
            meet: myMeets[index],
            onTap: () {
              AutoRouter.of(context).push(MeetsChatRoute(meet: myMeets[index]));
            },
          ),
        ),
      ],
    );
  }
}
