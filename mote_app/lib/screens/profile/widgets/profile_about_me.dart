import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mote_app/models/test_users.dart';
import 'package:mote_app/screens/profile/widgets/change_desc_button.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

class ProfileAboutMe extends StatelessWidget {
  final TextEditingController controller;
  final String desc;
  final String work;
  final String education;
  final String sign;
  final void Function(String desc, String work, String education) onSave;
  const ProfileAboutMe({
    super.key,
    required this.controller,
    required this.desc,
    required this.work,
    required this.education,
    required this.sign,
    required this.onSave,
  });
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'О себе',
                style: theme.textTheme.headlineMedium,
              ),
              ChangeDescButton(
                onSave: onSave,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Ionicons.location_outline,
                    color: Colors.red[400],
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    TestUsers.dima.city,
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    sign,
                    style: theme.textTheme.bodyMedium,
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Flexible(
                child: Text(
                  desc,
                  style: const TextStyle(),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              const Icon(
                Ionicons.school_outline,
                color: Colors.grey,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Образование',
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              color: TSetColor.onBackgroundColor(context),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              education.isEmpty ? 'Нет информации' : education,
              style: theme.textTheme.bodySmall,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              const Icon(
                Ionicons.business_outline,
                color: Colors.grey,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Работа',
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            decoration: BoxDecoration(
              color: TSetColor.onBackgroundColor(context),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              work.isEmpty ? 'Нет информации' : work,
              style: theme.textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}
