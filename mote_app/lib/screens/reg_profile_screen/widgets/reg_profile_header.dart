import 'package:flutter/material.dart';

class RegProfileHeader extends StatelessWidget {
  final String name;
  final int age;
  const RegProfileHeader({
    super.key,
    required this.name,
    required this.age,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '$name, $age',
              style: theme.textTheme.headlineLarge,
            ),
          ],
        ),
      ),
    );
  }
}
