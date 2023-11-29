import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

class ChangePasswordContent extends StatelessWidget {
  const ChangePasswordContent({super.key});

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
                  Text(
                    'Изменить пароль',
                    style: theme.textTheme.headlineLarge,
                  )
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Column(
                children: [
                  const Row(
                    children: [
                      Text(
                        'Старый пароль',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          maxLines: 1,
                          obscureText: false,
                          decoration: const InputDecoration(
                            hintText: 'Старый пароль',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  const Row(
                    children: [
                      Text(
                        'Новый пароль',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                maxLines: 1,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  hintText: 'Новый пароль',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Ionicons.reload_outline,
                          color: TSetColor.buttonTextColor(context),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Изменить',
                          style: TextStyle(
                            color: TSetColor.buttonTextColor(context),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
