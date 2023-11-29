import 'package:flutter/material.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

class ProfilePhotoTip extends StatelessWidget {
  const ProfilePhotoTip({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: size.width,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        decoration: BoxDecoration(
          color: TSetColor.onBackgroundColor(context),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Icon(
              Icons.priority_high,
              size: 25,
              color: Colors.red[400],
            ),
            const SizedBox(
              width: 8,
            ),
            Flexible(
              child: Text(
                'Загрузи максимальное количество фотографий, чтобы повысыть внимание к своей анкете',
                style: theme.textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
