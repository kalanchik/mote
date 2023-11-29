import 'package:flutter/material.dart';

class SignBloc extends StatelessWidget {
  final String sign;
  const SignBloc({
    super.key,
    required this.sign,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Знак Зодиака',
              style: theme.textTheme.headlineMedium,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              sign,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
