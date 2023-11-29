import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:mote_app/models/group_message_model.dart';
import 'package:mote_app/models/meets_models.dart';
import 'package:mote_app/models/test_users.dart';
import 'package:mote_app/screens/meets_chat_screen/widgets/emoji_picker_widget.dart';
import 'package:mote_app/screens/meets_chat_screen/widgets/group_message_bubble.dart';
import 'package:mote_app/screens/meets_chat_screen/widgets/meets_bottom_action.dart';
import 'package:mote_app/screens/meets_chat_screen/widgets/meets_chat_appbar.dart';
import 'package:mote_app/screens/meets_chat_screen/widgets/meets_chat_info.dart';

@RoutePage()
class MeetsChatScreen extends StatefulWidget {
  final MeetsModels meet;
  const MeetsChatScreen({super.key, required this.meet});

  @override
  State<MeetsChatScreen> createState() => _MeetsChatScreenState();
}

class _MeetsChatScreenState extends State<MeetsChatScreen> {
  final List<MeetMessage> messages = [
    MeetUserMessage(
      messageText:
          'Officia deserunt tempor amet labore mollit ad excepteur quis nulla voluptate.',
      sendDate:
          '${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}',
      sendTime: '${DateTime.now().hour}:${DateTime.now().minute}',
      avatar: TestUsers.dima.imgUrls[0],
      userName: TestUsers.dima.name,
      isReceiver: true,
    ),
    MeetUserMessage(
      messageText:
          'Velit sunt elit in laboris enim fugiat aliqua elit ut labore proident ut velit.',
      sendDate:
          '${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}',
      sendTime: '${DateTime.now().hour}:${DateTime.now().minute}',
      avatar: TestUsers.anna.imgUrls[0],
      userName: TestUsers.anna.name,
      isReceiver: false,
    ),
    MeetUserMessage(
      messageText:
          'Elit ea sunt et et magna duis voluptate qui est occaecat incididunt adipisicing eu.',
      sendDate:
          '${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}',
      sendTime: '${DateTime.now().hour}:${DateTime.now().minute}',
      avatar: TestUsers.zlata.imgUrls[0],
      userName: TestUsers.zlata.name,
      isReceiver: false,
    ),
  ];
  late final List<MeetMessage> _messages;

  final inputController = TextEditingController();

  bool isEmojiVisible = false;
  bool isKeyboardVisivble = false;

  bool isRecording = false;

  String? path;
  late Directory appDirectory;

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    var kbController = KeyboardVisibilityController();
    kbController.onChange.listen((bool isVisible) {
      setState(() {
        isKeyboardVisivble = isVisible;
      });

      if (isKeyboardVisivble && isEmojiVisible) {
        setState(() {
          isKeyboardVisivble = false;
        });
      }
    });
    widget.meet.messageList.addAll(messages);
    _messages = widget.meet.messageList.reversed.toList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: MeetsChatAppBar(
          image: widget.meet.imageFile!,
          meetName: widget.meet.name,
          membersCount: widget.meet.memCount,
          activeUsers: widget.meet.membersList.length,
          meet: widget.meet,
        ),
      ),
      body: KeyboardDismissOnTap(
        child: Column(
          children: [
            Expanded(
              flex: 9,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: _messages.length,
                reverse: true,
                itemBuilder: (context, index) {
                  final currentMessage = _messages[index];
                  if (currentMessage is MeetNotify) {
                    return MeetsChatInfo(
                        messageText: currentMessage.messageText);
                  }
                  if (currentMessage is MeetUserMessage) {
                    return GroupMessageBubble(messageInfo: currentMessage);
                  }
                  return null;
                },
              ),
            ),
            MeetsBottomAction(
              closeEmoji: closeEmoji,
              onBlurred: toggleEmojiKeyboard,
              controller: inputController,
              isEmojiVisible: isEmojiVisible,
              isKeyboardVisivble: isKeyboardVisivble,
            ),
            Offstage(
              offstage: !isEmojiVisible,
              child: EmojiPickerWidget(
                onEmojiSelected: onEmojiSelected,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onEmojiSelected(String emoji) {
    setState(() {
      inputController.text = inputController.text + emoji;
    });
  }

  Future toggleEmojiKeyboard() async {
    if (isKeyboardVisivble) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
    setState(() {
      isEmojiVisible = !isEmojiVisible;
    });
  }

  void closeEmoji() {
    setState(() {
      isEmojiVisible = true;
    });
  }
}
