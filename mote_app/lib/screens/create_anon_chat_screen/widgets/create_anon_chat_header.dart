import 'package:flutter/material.dart';

class CreateAnonChatHeader extends StatelessWidget {
  const CreateAnonChatHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: <Widget>[
        Text(
          'Создание чата',
          style: theme.textTheme.headlineLarge,
        ),
      ],
    );
  }
}
