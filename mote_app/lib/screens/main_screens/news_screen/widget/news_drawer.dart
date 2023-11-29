import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mote_app/models/constants.dart';
import 'package:mote_app/router/router.dart';
import 'package:mote_app/screens/main_screens/news_screen/widget/drawer_tile.dart';
import 'package:mote_app/services/registration/registation.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

class NewsDrawer extends StatelessWidget {
  final int drawerIndex;
  final void Function(int newIndex) changeIndex;
  const NewsDrawer(
      {super.key, required this.drawerIndex, required this.changeIndex});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: TSetColor.backgroundColor(context),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 15,
                ),
                Image.asset(
                  '${Constants.imagePath}mote_logo.png',
                  width: 80,
                  fit: BoxFit.cover,
                ),
                Text(
                  'mote',
                  style: theme.textTheme.headlineLarge!.copyWith(
                    color: theme.primaryColor,
                  ),
                ),
              ],
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            DrawerTile(
              label: 'Главная',
              icon: Ionicons.home_outline,
              isSelected: 0 == drawerIndex,
              onTap: () {
                changeIndex(0);
                AutoRouter.of(context).pushAndPopUntil(const HomeRoute(),
                    predicate: (_) => false);
              },
            ),
            DrawerTile(
              label: 'Профиль',
              icon: Iconsax.profile_circle,
              isSelected: 1 == drawerIndex,
              onTap: () {
                changeIndex(1);
                AutoRouter.of(context).pushAndPopUntil(
                  const ProfileRoute(),
                  predicate: (route) => false,
                );
              },
            ),
            DrawerTile(
              label: 'Занкомства',
              icon: Ionicons.heart_outline,
              isSelected: 2 == drawerIndex,
              onTap: () {
                AutoRouter.of(context).pushAndPopUntil(const FriendShipRoute(),
                    predicate: (_) => false);
              },
            ),
            DrawerTile(
              label: 'Свидания',
              icon: Ionicons.accessibility_outline,
              isSelected: 3 == drawerIndex,
              onTap: () {
                AutoRouter.of(context).pushAndPopUntil(const DatesRoute(),
                    predicate: (_) => false);
              },
            ),
            DrawerTile(
              label: 'Мессенджер',
              icon: Ionicons.chatbubble_outline,
              isSelected: 4 == drawerIndex,
              onTap: () {
                AutoRouter.of(context).pushAndPopUntil(const MessangerRoute(),
                    predicate: (_) => false);
              },
            ),
            DrawerTile(
              label: 'Встречи',
              icon: Ionicons.people_outline,
              isSelected: 5 == drawerIndex,
              onTap: () {
                AutoRouter.of(context).pushAndPopUntil(const MeetsRoute(),
                    predicate: (_) => false);
              },
            ),
            DrawerTile(
              label: 'Анонимный чат',
              icon: Ionicons.chatbubbles_outline,
              isSelected: 6 == drawerIndex,
              onTap: () {
                AutoRouter.of(context).pushAndPopUntil(
                    const AnonMessangerRoute(),
                    predicate: (_) => false);
              },
            ),
            DrawerTile(
              label: 'Техническая поддержка',
              icon: Iconsax.support,
              isSelected: 7 == drawerIndex,
              onTap: () {
                AutoRouter.of(context).pushAndPopUntil(const HelpRoute(),
                    predicate: (_) => false);
              },
            ),
            DrawerTile(
              label: 'Настройки',
              icon: Icons.settings_outlined,
              isSelected: 8 == drawerIndex,
              onTap: () {
                AutoRouter.of(context).pushAndPopUntil(const SettingsRoute(),
                    predicate: (_) => false);
              },
            ),
            DrawerTile(
              label: 'О нас',
              icon: Icons.compare,
              isSelected: 9 == drawerIndex,
              onTap: () {
                AutoRouter.of(context).pushAndPopUntil(const CompanyInfoRoute(),
                    predicate: (_) => false);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              onTap: () async {
                await AuthService.logOut();
                await context.router.replaceAll([const LoginRoute()]);
              },
              leading: const Icon(Iconsax.logout),
              title: const Text(
                'Выйти',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
