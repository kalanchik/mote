import 'package:flutter/material.dart';
import 'package:mote_app/models/constants.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

class NewsAppInfo extends StatelessWidget {
  const NewsAppInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'mote',
                    style: theme.textTheme.headlineSmall!.copyWith(
                      color: theme.primaryColor,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                ],
              ),
              Text(
                '2 дня назад',
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            decoration: BoxDecoration(
              color: TSetColor.onBackgroundColor(context),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  height: 50,
                  width: 50,
                  child: Image.asset('${Constants.imagePath}mote_logo.png'),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Доступно обновление',
                      style: theme.textTheme.headlineSmall,
                    ),
                    Text(
                      'Установить новую версию?',
                      style: theme.textTheme.bodyMedium,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
