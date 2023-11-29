import 'package:flutter/material.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

class AnonChatAppBar extends StatelessWidget {
  final int chatId;
  final String chatStatus;
  final String chatTheme;
  const AnonChatAppBar({
    super.key,
    required this.chatId,
    required this.chatStatus,
    required this.chatTheme,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: TSetColor.onBackgroundColor(context),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                '#$chatId',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        chatTheme,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      chatStatus,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
            size: 27,
            color: Colors.grey,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_vert,
            size: 27,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
