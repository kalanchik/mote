import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mote_app/router/router.dart';
import 'package:mote_app/screens/main_screens/news_screen/widget/news_drawer.dart';
import 'package:mote_app/screens/settings_screen/widgets/settings_container.dart';
import 'package:mote_app/screens/settings_screen/widgets/settings_tile.dart';
import 'package:mote_app/screens/settings_screen/widgets/settings_tile_switch.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool newsNotif = true;
  bool likeNotif = true;
  bool dateNotif = true;
  bool meetNotif = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      drawer: NewsDrawer(drawerIndex: 8, changeIndex: (index) {}),
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: AnimateList(
              effects: [],
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'Настройки',
                      style: theme.textTheme.headlineLarge,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                SettingsContainer(
                  headerText: 'Аккаунт',
                  iconData: Ionicons.person_outline,
                  children: [
                    SettingsTile(
                      labelText: 'Редактировать аккаунт',
                      onTap: () {
                        AutoRouter.of(context)
                            .push(SettingsDetailsRoute(widgetKey: 0));
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SettingsTile(
                      labelText: 'Изменить пароль',
                      onTap: () {
                        AutoRouter.of(context)
                            .push(SettingsDetailsRoute(widgetKey: 1));
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SettingsTile(
                      labelText: 'Конфиденциальность',
                      onTap: () {
                        AutoRouter.of(context)
                            .push(SettingsDetailsRoute(widgetKey: 2));
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                SettingsContainer(
                  headerText: 'Уведомления',
                  iconData: Ionicons.notifications_outline,
                  children: [
                    SettingsTileSwitch(
                      labelText: 'Сообщать о новостях',
                      isActive: newsNotif,
                      onTap: (bool value) {
                        setState(() {
                          newsNotif = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SettingsTileSwitch(
                      labelText: 'Сообщать о лайках',
                      isActive: likeNotif,
                      onTap: (bool value) {
                        setState(() {
                          likeNotif = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SettingsTileSwitch(
                      labelText: 'Сообщать о свиданиях',
                      isActive: dateNotif,
                      onTap: (bool value) {
                        setState(() {
                          dateNotif = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SettingsTileSwitch(
                      labelText: 'Сообщать о встречах',
                      isActive: meetNotif,
                      onTap: (bool value) {
                        setState(() {
                          meetNotif = value;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                const SettingsContainer(
                  headerText: 'Дополнительно',
                  iconData: Ionicons.reader_outline,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Локализация',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'ru-RU',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Ionicons.log_out_outline,
                          color: TSetColor.buttonTextColor(context),
                          size: 25,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text(
                          'Выйти из аккаунта',
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
