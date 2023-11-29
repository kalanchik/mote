import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:mote_app/models/anon_chat_model.dart';
import 'package:mote_app/models/message.dart';
import 'package:mote_app/screens/anon_chat_screen/widgets/anon_chat_appbar.dart';
import 'package:mote_app/screens/anon_chat_screen/widgets/anon_chat_bubble.dart';
import 'package:mote_app/screens/meets_chat_screen/widgets/emoji_picker_widget.dart';
import 'package:mote_app/screens/meets_chat_screen/widgets/meets_bottom_action.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

@RoutePage()
class AnonChatScreen extends StatefulWidget {
  final AnonChatModel anonChat;
  const AnonChatScreen({super.key, required this.anonChat});

  @override
  State<AnonChatScreen> createState() => _AnonChatScreenState();
}

class _AnonChatScreenState extends State<AnonChatScreen> {
  final inputController = TextEditingController();

  late final List<Message> _messages;

  bool isEmojiVisible = false;
  bool isKeyboardVisivble = false;

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
    _messages = widget.anonChat.messages.reversed.toList();
    super.initState();
  }

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: TSetColor.backgroundColor(context),
    ));
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: AnonChatAppBar(
          chatId: widget.anonChat.chatId,
          chatStatus: widget.anonChat.status,
          chatTheme: widget.anonChat.chatTheme,
        ),
      ),
      body: KeyboardDismissOnTap(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 9,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: _messages.length,
                reverse: true,
                itemBuilder: (contex, index) {
                  return AnonChatBubble(
                    messageInfo: _messages[index],
                  );
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
