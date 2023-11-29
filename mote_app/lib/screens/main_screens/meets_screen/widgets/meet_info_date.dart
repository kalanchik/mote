import 'package:flutter/material.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

class MeetInfoDate extends StatelessWidget {
  final String date;
  const MeetInfoDate({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: TSetColor.backgroundColor(context),
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Дата встречи',
                  style: theme.textTheme.headlineMedium,
                ),
                Text(
                  date,
                  style: theme.textTheme.bodySmall!.copyWith(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Время встречи',
                  style: theme.textTheme.headlineMedium,
                ),
                Text(
                  TimeOfDay.now().format(context),
                  style: theme.textTheme.bodySmall!.copyWith(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    child: const Text('Присоединиться'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
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
