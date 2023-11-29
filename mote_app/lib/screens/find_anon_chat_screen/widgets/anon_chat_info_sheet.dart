import 'package:flutter/material.dart';
import 'package:mote_app/models/anon_chat_model.dart';
import 'package:mote_app/screens/find_anon_chat_screen/widgets/chat_sheet_about_me.dart';
import 'package:mote_app/screens/find_anon_chat_screen/widgets/chat_sheet_companion.dart';
import 'package:mote_app/screens/find_anon_chat_screen/widgets/chat_sheet_desc.dart';
import 'package:mote_app/screens/find_anon_chat_screen/widgets/chat_sheet_header.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

class AnonChatInfoSheet extends StatefulWidget {
  final AnonChatModel anonChat;
  final void Function() joinChat;
  const AnonChatInfoSheet({
    super.key,
    required this.anonChat,
    required this.joinChat,
  });

  @override
  State<AnonChatInfoSheet> createState() => _AnonChatInfoSheetState();
}

class _AnonChatInfoSheetState extends State<AnonChatInfoSheet> {
  bool showDesc = false;
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.75,
      maxChildSize: 0.8,
      minChildSize: 0.3,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: TSetColor.onBackgroundColor(context),
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
            ),
            child: ListView(
              controller: scrollController,
              children: [
                ChatSheetHeader(
                  chatId: widget.anonChat.chatId,
                  chatTheme: widget.anonChat.chatTheme,
                  createdDate: widget.anonChat.createDate,
                ),
                const SizedBox(
                  height: 10,
                ),
                ChatSheetAboutMe(
                    showGender: widget.anonChat.showGender,
                    showAge: widget.anonChat.showAge,
                    age: widget.anonChat.user1.age,
                    gender: widget.anonChat.user1Gender),
                const SizedBox(
                  height: 10,
                ),
                ChatSheetCompanion(
                  gender: widget.anonChat.user2Gender,
                  ageRange: widget.anonChat.ageRange,
                ),
                const SizedBox(
                  height: 10,
                ),
                ChatSheetDesc(
                  desc: widget.anonChat.desc,
                  joinChat: widget.joinChat,
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
