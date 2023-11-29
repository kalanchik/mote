import 'package:flutter/material.dart';
import 'package:flutter_emoji_feedback/flutter_emoji_feedback.dart';
import 'package:mote_app/models/constants.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

class NewsDateFeedback extends StatelessWidget {
  const NewsDateFeedback({super.key});

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
                    'Знакомства',
                    style: theme.textTheme.headlineSmall,
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    Icons.favorite,
                    color: Colors.red[400],
                  ),
                ],
              ),
              Text(
                '21.07.2023',
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
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Как прошло свидание?',
                      style: theme.textTheme.headlineSmall,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 30,
                          backgroundImage: AssetImage(
                            '${Constants.imagePath}user2.jpg',
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Аня, 19',
                          style: theme.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 30,
                          backgroundImage: AssetImage(
                            '${Constants.imagePath}user3.jpg',
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Дима, 19',
                          style: theme.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: EmojiFeedback(
                        animDuration: const Duration(milliseconds: 300),
                        curve: Curves.bounceIn,
                        inactiveElementScale: 0.7,
                        onChanged: (value) {
                          print(value);
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 130,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          'Отправить',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 130,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          'Подробнее',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                      ),
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
