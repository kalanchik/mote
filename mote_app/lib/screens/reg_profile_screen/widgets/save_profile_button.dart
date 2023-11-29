import 'package:flutter/material.dart';

class SaveProfileButton extends StatelessWidget {
  final VoidCallback onTap;
  const SaveProfileButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: const Text(
        'Сохранить анкету',
        style: TextStyle(),
      ),
    );
  }
}
