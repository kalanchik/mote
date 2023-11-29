import 'package:flutter/material.dart';

class MeetsChatInfo extends StatelessWidget {
  final String messageText;
  const MeetsChatInfo({
    super.key,
    required this.messageText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: const BoxDecoration(),
          child: Center(
            child: Text(
              messageText,
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
