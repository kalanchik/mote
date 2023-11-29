import 'package:flutter/material.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProfileIndicator extends StatelessWidget {
  final int progress;
  const ProfileIndicator({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: TSetColor.onBackgroundColor(context),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            CircularPercentIndicator(
              radius: 30,
              percent: progress / 100,
              lineWidth: 8,
              progressColor: Theme.of(context).primaryColor,
            ),
            const SizedBox(
              width: 20,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Профиль заполнен на $progress%',
                        style: theme.textTheme.headlineSmall,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Чтобы твой профиль собирал больше лайков, расскажи как можно больше о себе!',
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
