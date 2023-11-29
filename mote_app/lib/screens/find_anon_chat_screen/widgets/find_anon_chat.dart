import 'package:flutter/material.dart';
import 'package:mote_app/models/anon_chat_model.dart';
import 'package:mote_app/screens/find_anon_chat_screen/widgets/anon_chat_info_sheet.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

class FindAnonChat extends StatelessWidget {
  final AnonChatModel anonChat;
  final void Function() joinChat;
  const FindAnonChat({
    super.key,
    required this.anonChat,
    required this.joinChat,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {
        _openSheet(context);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Row(
          children: <Widget>[
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          anonChat.chatTheme,
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                          style: theme.textTheme.headlineSmall,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        anonChat.createDate,
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          anonChat.desc,
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          style: theme.textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      showDragHandle: false,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => AnonChatInfoSheet(
        anonChat: anonChat,
        joinChat: joinChat,
      ),
    );
  }
}
