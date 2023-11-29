import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

class ProfileSurveyTip extends StatelessWidget {
  const ProfileSurveyTip({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        color: TSetColor.onBackgroundColor(context),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Iconsax.info_circle,
                size: 25,
                color: Colors.red[400],
              ),
              const SizedBox(
                width: 8,
              ),
              Flexible(
                child: Column(
                  children: [
                    Text(
                      'Пройди короткий опрос, чтобы твоя анкета собирала больше лайков',
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
