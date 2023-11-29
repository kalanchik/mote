import 'package:flutter/material.dart';

class MeetsBottomAction extends StatefulWidget {
  final void Function() onBlurred;
  final TextEditingController controller;
  final bool isEmojiVisible;
  final bool isKeyboardVisivble;
  final void Function() closeEmoji;
  const MeetsBottomAction({
    super.key,
    required this.onBlurred,
    required this.controller,
    required this.isEmojiVisible,
    required this.isKeyboardVisivble,
    required this.closeEmoji,
  });

  @override
  State<MeetsBottomAction> createState() => _MeetsBottomActionState();
}

class _MeetsBottomActionState extends State<MeetsBottomAction> {
  @override
  void initState() {
    super.initState();
  }

  final focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildEmoji(),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15),
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 300,
              ),
              child: TextFormField(
                onTap: () => widget.closeEmoji,
                focusNode: focusNode,
                controller: widget.controller,
                onChanged: (value) {
                  setState(() {});
                },
                keyboardType: TextInputType.text,
                maxLines: null,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Напиши сообщение ...',
                ),
              ),
            ),
          ),
        ),
        _buildSendOrVoiceButton(widget.controller.text.isNotEmpty),
      ],
    );
  }

  Widget _buildSendOrVoiceButton(bool isSend) {
    if (isSend) {
      return IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.send,
          color: Theme.of(context).primaryColor,
          size: 30,
        ),
      );
    }
    return IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.mic,
        color: Colors.grey,
        size: 30,
      ),
    );
  }

  void onClickedEmoji() {
    if (widget.isEmojiVisible) {
      focusNode.requestFocus();
    } else if (widget.isKeyboardVisivble) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
    widget.onBlurred();
  }

  Widget buildEmoji() {
    return Container(
      child: IconButton(
        icon: Icon(
          widget.isEmojiVisible
              ? Icons.keyboard_rounded
              : Icons.emoji_emotions_outlined,
          color: Colors.grey,
          size: 30,
        ),
        onPressed: onClickedEmoji,
      ),
    );
  }
}
