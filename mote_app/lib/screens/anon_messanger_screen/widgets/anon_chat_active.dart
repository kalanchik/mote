import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mote_app/models/anon_chat_model.dart';
import 'package:mote_app/models/test_users.dart';
import 'package:mote_app/screens/main_screens/messanger_screen/widgets/anon_chat.dart';

class AnonChatList extends StatelessWidget {
  final String headerText;
  final List<AnonChatModel> chatList;
  final IoniconsData icon;
  final Color? iconColor;
  final String chatStatus;
  const AnonChatList({
    super.key,
    required this.headerText,
    required this.chatList,
    required this.icon,
    this.iconColor,
    required this.chatStatus,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                color: iconColor,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                headerText,
                style: theme.textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ...List<Widget>.generate(TestUsers.anonChats.length, (index) {
          final isLast = TestUsers.anonChats.length - 1 == index;
          return AnonChat(
            anonChat: TestUsers.anonChats[index],
            isLast: isLast,
            chatStatus: chatStatus,
          );
        })
      ],
    );
  }
}
