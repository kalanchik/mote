import 'package:flutter/material.dart';
import 'package:swipable_stack/swipable_stack.dart';

class CardOverlay extends StatelessWidget {
  final SwipeDirection direction;
  const CardOverlay({super.key, required this.direction});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 800),
      curve: Curves.fastLinearToSlowEaseIn,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            if (direction == SwipeDirection.right)
              Theme.of(context).primaryColor,
            if (direction == SwipeDirection.left)
              const Color.fromARGB(255, 127, 183, 224),
            const Color.fromARGB(0, 0, 0, 0),
          ],
        ),
      ),
    );
  }
}
