import 'package:flutter/material.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

class WelcomeBanner extends StatelessWidget {
  final String name;
  final String mainPhoto;
  const WelcomeBanner({
    super.key,
    required this.name,
    required this.mainPhoto,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: theme.primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'С возвращением, $name!',
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: TSetColor.buttonTextColor(context),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Будем смотреть анкеты сегодня?',
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: TSetColor.buttonTextColor(context),
                ),
              ),
            ],
          ),
          CircleAvatar(
            backgroundColor: Colors.grey[200],
            backgroundImage: NetworkImage(mainPhoto),
            radius: 25,
          ),
        ],
      ),
    );
  }
}
