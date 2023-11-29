import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mote_app/models/constants.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

class NewsNewMessage extends StatelessWidget {
  const NewsNewMessage({
    super.key,
  });

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
                    'Мессенджер',
                    style: theme.textTheme.headlineSmall,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Icon(
                    Ionicons.chatbubble_sharp,
                    color: Colors.blueAccent,
                    size: 25,
                  ),
                ],
              ),
              Text(
                '5 часов назад',
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
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 25,
                  backgroundImage: AssetImage(
                    '${Constants.imagePath}user1.jpg',
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'У вас 5 новых сообщений',
                        style: theme.textTheme.headlineSmall,
                      ),
                      Text(
                        'Марина ждет вашего ответа',
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
