import 'package:flutter/material.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

class ChatSheetHeader extends StatelessWidget {
  final int chatId;
  final String chatTheme;
  final String createdDate;
  const ChatSheetHeader({
    super.key,
    required this.chatId,
    required this.chatTheme,
    required this.createdDate,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: TSetColor.backgroundColor(context),
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(20),
          top: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Анонимный чат',
                  style: theme.textTheme.headlineLarge,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.grey,
                    size: 30,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    color: TSetColor.onBackgroundColor(context),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      '#$chatId',
                      style: theme.textTheme.headlineMedium,
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
                        children: [
                          Flexible(
                            child: Text(
                              chatTheme,
                              style: theme.textTheme.headlineMedium,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            createdDate,
                            style: theme.textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
