import 'package:flutter/material.dart';

class HelpHeader extends StatelessWidget {
  const HelpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Flexible(
            child: Text(
              'Техническая поддержка',
              style: theme.textTheme.headlineLarge,
            ),
          ),
        ],
      ),
    );
  }
}
