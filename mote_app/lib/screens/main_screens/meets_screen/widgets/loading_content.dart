import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MeetsLoadingContent extends StatelessWidget {
  final String labelText;
  const MeetsLoadingContent({super.key, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          labelText,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ).animate().scale(
          delay: 300.ms,
          duration: 600.ms,
          curve: Curves.fastEaseInToSlowEaseOut,
        );
  }
}
