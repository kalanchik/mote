import 'package:flutter/material.dart';

class MyPassContent extends StatelessWidget {
  const MyPassContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: const Center(
      child: Text(
        'У тебя пока нет\nни одной подписки',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
        ),
      ),
    ));
  }
}
