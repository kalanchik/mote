import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mote_app/models/chat.dart';

class PinnedChats extends StatelessWidget {
  final List<Chat> pinnedChats;
  const PinnedChats({super.key, required this.pinnedChats});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Ionicons.bookmark_outline,
              color: Colors.orange[600],
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Важные',
              style: theme.textTheme.headlineMedium,
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        // NoramlChatTest(
        //   chat: pinnedChats[0],
        // ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
