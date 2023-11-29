import 'package:flutter/material.dart';
import 'package:mote_app/models/test_users.dart';
import 'package:mote_app/screens/main_screens/friendship_screen/widgets/match_card.dart';

class MutualSympathy extends StatelessWidget {
  final List myMatch;
  const MutualSympathy({super.key, required this.myMatch});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text(
                'Взаимные симпатии',
                style: theme.textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        myMatch.isEmpty
            ? Container(
                height: 50,
                child: Center(
                  child: Text(
                    'У тебя пока еще нет совпадений 😢',
                    style: theme.textTheme.headlineSmall!.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ),
              )
            : SizedBox(
                height: 160,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: myMatch.length,
                  itemBuilder: (context, index) {
                    final match = myMatch[index];
                    return MatchCard(user: TestUsers.dima);
                  },
                ),
              ),
      ],
    );
  }
}
