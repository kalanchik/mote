import 'package:flutter/material.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

class ChatSheetAboutMe extends StatelessWidget {
  final bool showGender;
  final bool showAge;
  final int age;
  final String gender;
  const ChatSheetAboutMe({
    super.key,
    required this.showGender,
    required this.showAge,
    required this.age,
    required this.gender,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: TSetColor.backgroundColor(context),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  'О себе',
                  style: theme.textTheme.headlineMedium,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  'Пол',
                  style: theme.textTheme.headlineSmall,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  showGender ? gender : 'Собеседник скрыл свой пол',
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  'Возраст',
                  style: theme.textTheme.headlineSmall,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  showAge ? '$age' : 'Собеседник скрыл свой возраст',
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
