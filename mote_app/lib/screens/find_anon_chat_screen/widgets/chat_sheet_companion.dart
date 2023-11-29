import 'package:flutter/material.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

class ChatSheetCompanion extends StatelessWidget {
  final String gender;
  final String ageRange;
  const ChatSheetCompanion(
      {super.key, required this.gender, required this.ageRange});

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
                  'Требования',
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
                  gender,
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
                  'Возсраст',
                  style: theme.textTheme.headlineSmall,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  ageRange == '1-100' ? 'Любой' : ageRange,
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
