import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mote_app/screens/settings_details/widgets/account_save_button.dart';
import 'package:mote_app/screens/settings_details/widgets/change_account_tile.dart';

class ChangeAccountContent extends StatelessWidget {
  const ChangeAccountContent({super.key});

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
                      'Редактировать аккаунт',
                      style: theme.textTheme.headlineLarge,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Icon(
                    Ionicons.newspaper_outline,
                    size: 30,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Данные',
                    style: theme.textTheme.headlineMedium,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              const ChangeAccountTile(
                paramName: 'Имя',
                hintText: 'Дима',
                icon: Ionicons.happy_outline,
              ),
              const SizedBox(
                height: 10,
              ),
              const ChangeAccountTile(
                paramName: 'Почта',
                hintText: 'kalanchik123@gmail.com',
                icon: Ionicons.mail_outline,
              ),
              const SizedBox(
                height: 10,
              ),
              const ChangeAccountTile(
                paramName: 'Telegram',
                hintText: '@kalanchik',
                icon: Ionicons.paper_plane_outline,
              ),
              const SizedBox(
                height: 30,
              ),
              const AccountSaveButton(),
            ],
          ),
        ),
      ),
    );
  }
}
