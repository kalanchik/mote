import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mote_app/models/anon_chat_model.dart';
import 'package:mote_app/router/router.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

class AnonChat extends StatelessWidget {
  final AnonChatModel anonChat;
  final bool isLast;
  final String chatStatus;
  const AnonChat({
    super.key,
    required this.anonChat,
    required this.isLast,
    required this.chatStatus,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lastIndex = anonChat.messages.length - 1;
    return InkWell(
      onTap: () {
        AutoRouter.of(context).push(AnonChatRoute(anonChat: anonChat));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: TSetColor.onBackgroundColor(context),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  '#${anonChat.chatId}',
                  style: theme.textTheme.headlineSmall,
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        anonChat.chatTheme,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.headlineSmall,
                      ),
                      Text(
                        anonChat.messages[lastIndex].sendDate,
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          anonChat.messages[lastIndex].message,
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          style: theme.textTheme.bodySmall,
                        ),
                      ),
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
