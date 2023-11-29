import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

class UserInfoHeader extends StatelessWidget {
  const UserInfoHeader({
    super.key,
    required this.name,
    required this.age,
    required this.work,
    required this.education,
    required this.city,
  });

  final String name;
  final int age;
  final String work;
  final String education;
  final String city;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$name, $age',
                style: theme.textTheme.headlineMedium,
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                work,
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text(
                education,
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Icon(
                Ionicons.location_sharp,
                color: theme.primaryColor,
              ),
              const SizedBox(
                width: 2,
              ),
              Text(
                city,
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Divider(
            thickness: 1,
            color: TSetColor.onBackgroundColor(context),
          ),
        ],
      ),
    );
  }
}
