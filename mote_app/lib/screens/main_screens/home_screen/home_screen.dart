import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mote_app/router/router.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: TSetColor.backgroundColor(context),
    ));
    return AutoTabsRouter(
      lazyLoad: true,
      routes: [
        const NewsRoute(),
        const MapRoute(),
        const PassRoute(),
      ],
      builder: (context, child) {
        final autoTabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          backgroundColor: TSetColor.backgroundColor(context),
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            enableFeedback: false,
            elevation: 0,
            backgroundColor: TSetColor.backgroundColor(context),
            type: BottomNavigationBarType.fixed,
            selectedItemColor: TSetColor.textColor(context),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
            currentIndex: autoTabsRouter.activeIndex,
            onTap: (value) => autoTabsRouter.setActiveIndex(value),
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Ionicons.newspaper_outline),
                label: 'Новости',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Ionicons.location_outline),
                label: 'Карта',
              ),
              BottomNavigationBarItem(
                icon: const Icon(Ionicons.ticket_outline),
                activeIcon: Icon(
                  Ionicons.ticket_outline,
                  color: Theme.of(context).primaryColor,
                ),
                label: 'Подписка',
              ),
            ],
          ),
        );
      },
    );
  }

  void _openPage(int index, TabsRouter tabsRouter) {
    setState(() {
      tabsRouter.setActiveIndex(index);
    });
  }
}
