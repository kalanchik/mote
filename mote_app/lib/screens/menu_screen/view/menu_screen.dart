import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mote_app/router/router.dart';
import 'package:mote_app/screens/menu_screen/widgets/menu_tile.dart';

@RoutePage()
class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: AnimateList(
                        delay: 500.ms,
                        interval: 50.ms,
                        effects: [
                          FadeEffect(
                            duration: 600.ms,
                            curve: Curves.fastEaseInToSlowEaseOut,
                          ),
                          SlideEffect(
                            curve: Curves.fastEaseInToSlowEaseOut,
                            duration: 600.ms,
                            begin: const Offset(-1, 0),
                          ),
                        ],
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          MenuTile(
                            name: 'Профиль',
                            icon: Ionicons.person_outline,
                            onTap: () {
                              AutoRouter.of(context).push(const ProfileRoute());
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          MenuTile(
                            name: 'Знакомства',
                            icon: Ionicons.heart_outline,
                            onTap: () {
                              AutoRouter.of(context)
                                  .push(const FriendShipRoute());
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          MenuTile(
                            name: 'Свидания',
                            icon: Ionicons.accessibility_outline,
                            onTap: () {
                              AutoRouter.of(context).push(const DatesRoute());
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          MenuTile(
                            name: 'Мессенджер',
                            icon: Ionicons.chatbubble_outline,
                            onTap: () {
                              AutoRouter.of(context)
                                  .push(const MessangerRoute());
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          MenuTile(
                            name: 'Встречи',
                            icon: Ionicons.people_outline,
                            onTap: () {
                              AutoRouter.of(context).push(const MeetsRoute());
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          MenuTile(
                            name: 'Анонимный чат',
                            icon: Ionicons.chatbubbles_outline,
                            onTap: () {
                              AutoRouter.of(context)
                                  .push(const AnonMessangerRoute());
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          MenuTile(
                            name: 'Настройки',
                            icon: Ionicons.settings_outline,
                            onTap: () {
                              AutoRouter.of(context)
                                  .push(const SettingsRoute());
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          MenuTile(
                            name: 'Техническая поддержка',
                            icon: Ionicons.help_outline,
                            onTap: () {
                              AutoRouter.of(context).push(const HelpRoute());
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          MenuTile(
                            name: 'О нас',
                            icon: Ionicons.people_outline,
                            onTap: () {
                              AutoRouter.of(context)
                                  .push(const CompanyInfoRoute());
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          MenuTile(
                            name: 'Пригласить друга',
                            icon: Ionicons.person_add_outline,
                            onTap: () {
                              AutoRouter.of(context)
                                  .push(const CompanyInfoRoute());
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
