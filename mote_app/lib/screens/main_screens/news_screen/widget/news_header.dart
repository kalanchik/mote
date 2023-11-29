import 'package:flutter/material.dart';

class NewsHeader extends StatelessWidget {
  const NewsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Новости',
          style: theme.textTheme.headlineLarge,
        ),
      ],
    );
  }
}
