import 'package:flutter/material.dart';

class CreateDateHeader extends StatelessWidget {
  const CreateDateHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(
            'Создать свидание',
            style: theme.textTheme.headlineLarge,
          ),
        ],
      ),
    );
  }
}
