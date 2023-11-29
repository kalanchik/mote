import 'package:flutter/material.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

class ChatGenderButton extends StatelessWidget {
  final void Function() onTap;
  final int index;
  final List<String> items;

  const ChatGenderButton({
    super.key,
    required this.onTap,
    required this.index,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: TSetColor.onBackgroundColor(context),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            items[index],
            style: const TextStyle(),
          ),
        ),
      ),
    );
  }
}
