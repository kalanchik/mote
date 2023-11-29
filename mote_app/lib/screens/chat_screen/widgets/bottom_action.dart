import 'package:flutter/material.dart';

class BottomAction extends StatefulWidget {
  final void Function(String message) sendMessage;
  const BottomAction({
    super.key,
    required this.sendMessage,
  });

  @override
  State<BottomAction> createState() => _BottomActionState();
}

class _BottomActionState extends State<BottomAction> {
  final TextEditingController messageController = TextEditingController();
  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(vertical: 0),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          const Divider(
            height: 0,
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.emoji_emotions_outlined,
                  color: Colors.grey,
                  size: 30,
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextField(
                    controller: messageController,
                    maxLines: null,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[400],
                      ),
                      hintText: 'Напиши сообщение ...',
                    ),
                    cursorColor: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  widget.sendMessage(messageController.text.trim());
                },
                icon: const Icon(
                  Icons.send,
                  size: 30,
                  color: Colors.grey,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
