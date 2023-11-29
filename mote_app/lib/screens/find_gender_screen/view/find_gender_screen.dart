import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mote_app/models/register_user.dart';
import 'package:mote_app/router/router.dart';
import 'package:mote_app/screens/find_gender_screen/widget/gender_button.dart';

@RoutePage()
class FindGenderScreen extends StatelessWidget {
  const FindGenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  'Настройки поиска',
                  style: theme.textTheme.headlineLarge,
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Кто тебе интересен?',
                      style: theme.textTheme.headlineMedium,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GenderButton(
                        icon: '👸 ',
                        label: 'Девушки',
                        onTap: () {
                          GetIt.I<RegisterUser>()
                              .setFindGender(gender: 'Девушки');
                          AutoRouter.of(context).push(const RegProfileRoute());
                        },
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      GenderButton(
                        icon: '🤵 ',
                        label: 'Парни',
                        onTap: () {
                          GetIt.I<RegisterUser>()
                              .setFindGender(gender: 'Парни');
                          AutoRouter.of(context).push(const RegProfileRoute());
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GenderButton(
                      icon: '',
                      label: 'Не важно',
                      onTap: () {
                        GetIt.I<RegisterUser>()
                            .setFindGender(gender: 'Не важно');
                        AutoRouter.of(context).push(const RegProfileRoute());
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
