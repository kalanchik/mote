import 'package:flutter/material.dart';

class ProfileAppBarContent extends StatelessWidget {
  final String imgUrl;
  final String name;
  final int age;
  const ProfileAppBarContent({
    super.key,
    required this.imgUrl,
    required this.name,
    required this.age,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        CircleAvatar(
          radius: 22,
          backgroundImage: NetworkImage(imgUrl),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          '$name, $age',
          style: theme.textTheme.headlineMedium,
        ),
      ],
    );
  }
}
