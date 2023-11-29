import 'package:flutter/material.dart';
import 'package:mote_app/models/constants.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

class NewsMatch extends StatelessWidget {
  const NewsMatch({super.key});

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
                '18.10.2023',
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
                      'У тебя взаимная симпатия',
                      style: theme.textTheme.headlineSmall,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 25,
                          backgroundImage: AssetImage(
                            '${Constants.imagePath}user1.jpg',
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Марина, 45',
                          style: theme.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.favorite,
                          color: Colors.red[400],
                        ),
                        Container(
                          width: 100,
                          height: 5,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        Icon(
                          Icons.favorite,
                          color: Colors.red[400],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 25,
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
