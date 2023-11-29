import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mote_app/models/chat/last_message.dart';
import 'package:mote_app/models/mote_models/fire_chat.dart';
import 'package:mote_app/router/router.dart';

class NoramlChat extends StatelessWidget {
  final FireChat chat;
  const NoramlChat({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    final lastMessage = LastMessage.fromJson(chat.lastMessage);
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {
        AutoRouter.of(context).push(ChatRoute(chat: chat));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    chat.mainPhoto,
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
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            chat.name,
                            style: theme.textTheme.headlineMedium,
                          ),
                        ],
                      ),
                      Text(
                        '${lastMessage.createdAt.day}.${lastMessage.createdAt.month}.${lastMessage.createdAt.year}',
                        style: theme.textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          lastMessage.message.isEmpty
                              ? 'Чат создан 👋'
                              : lastMessage.message,
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                          style: theme.textTheme.bodySmall,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      // Container(
                      //   padding: const EdgeInsets.all(7),
                      //   decoration: BoxDecoration(
                      //     color: Theme.of(context).primaryColor,
                      //     shape: BoxShape.circle,
                      //   ),
                      //   child: const Center(
                      //     child: Text(
                      //       '1',
                      //       style: TextStyle(
                      //         color: Colors.white,
                      //         fontSize: 12,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
