import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mote_app/screens/settings_details/widgets/selected_button.dart';
import 'package:mote_app/screens/settings_screen/widgets/settings_container.dart';

class ChangePrivacyContent extends StatefulWidget {
  const ChangePrivacyContent({super.key});

  @override
  State<ChangePrivacyContent> createState() => _ChangePrivacyContentState();
}

class _ChangePrivacyContentState extends State<ChangePrivacyContent> {
  bool findProfile = false;
  final List<String> findProfileList = ['Все', 'Никто'];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                    child: Text(
                      'Конфиденциальность',
                      style: theme.textTheme.headlineLarge!.copyWith(
                        fontSize: 28,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              const SettingsContainer(
                headerText: 'Поиск',
                iconData: Ionicons.search_outline,
                children: [
                  PrivacyTile(
                    paramName: 'Кто может видеть мою анкету',
                    items: [
                      DropdownMenuEntry(value: 'Все', label: 'Все'),
                      DropdownMenuEntry(value: 'Никто', label: 'Никто'),
                    ],
                    initialItem: 'Все',
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const SettingsContainer(
                headerText: 'Сообщения',
                iconData: Ionicons.chatbubble_outline,
                children: [
                  PrivacyTile(
                    paramName: 'Кто может отправлять мне сообщения',
                    items: [
                      DropdownMenuEntry(value: 'Все', label: 'Все'),
                      DropdownMenuEntry(value: 'Друзья', label: 'Друзья'),
                      DropdownMenuEntry(value: 'Никто', label: 'Никто'),
                    ],
                    initialItem: 'Все',
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const SettingsContainer(
                headerText: 'Свидания',
                iconData: Ionicons.heart_outline,
                children: [
                  PrivacyTile(
                    paramName: 'Кто может приглашать меня на свидания?',
                    items: [
                      DropdownMenuEntry(value: 'Все', label: 'Все'),
                      DropdownMenuEntry(value: 'Друзья', label: 'Друзья'),
                      DropdownMenuEntry(value: 'Никто', label: 'Никто'),
                    ],
                    initialItem: 'Все',
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const SettingsContainer(
                headerText: 'Профиль',
                iconData: Ionicons.person_outline,
                children: [
                  PrivacyTile(
                    paramName: 'Кто может смотреть мой профиль?',
                    items: [
                      DropdownMenuEntry(value: 'Все', label: 'Все'),
                      DropdownMenuEntry(value: 'Друзья', label: 'Друзья'),
                      DropdownMenuEntry(value: 'Никто', label: 'Никто'),
                    ],
                    initialItem: 'Все',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
