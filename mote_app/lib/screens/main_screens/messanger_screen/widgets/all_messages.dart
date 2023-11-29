import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mote_app/models/chat.dart';

class AllChats extends StatelessWidget {
  final List<Chat> chats;
  const AllChats({
    super.key,
    required this.chats,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Row(
          children: [
            const Icon(
              Iconsax.message,
              color: Colors.blue,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              'Все чаты',
              style: theme.textTheme.headlineMedium,
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        ...List.generate(
          chats.length,
          (index) {
            final lastIndex = chats.length - 1;
            final chat = chats[index];
            if (index != lastIndex) {
              return const Column(
                children: [
                  // NoramlChatTest(chat: chat),
                ],
              );
            }
            // return NoramlChatTest(chat: chat);
            return Container();
          },
        )
      ],
    );
  }
}
