import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class CitySelector extends StatelessWidget {
  const CitySelector({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Icon(
            Ionicons.location_sharp,
            color: Colors.red[400],
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            'Нижний Новгород',
            style: theme.textTheme.headlineMedium,
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}
