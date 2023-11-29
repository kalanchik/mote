import 'package:flutter/material.dart';

class RegInfoAppBar extends StatelessWidget {
  const RegInfoAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 70,
            ),
            Row(
              children: <Widget>[
                Text(
                  'Профиль',
                  style: theme.textTheme.headlineLarge,
                ),
              ],
            ),
            const Row(
              children: <Widget>[
                Flexible(
                  child: Text(
                    'Теперь выбери свой знак зодиака и свои интересы',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
