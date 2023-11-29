import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mote_app/models/test_users.dart';
import 'package:mote_app/screens/anon_messanger_screen/widgets/anon_chat_active.dart';
import 'package:mote_app/screens/anon_messanger_screen/widgets/anon_messanger_header.dart';
import 'package:mote_app/screens/main_screens/messanger_screen/widgets/search_button.dart';
import 'package:mote_app/screens/main_screens/news_screen/widget/news_drawer.dart';

@RoutePage()
class AnonMessangerScreen extends StatelessWidget {
  const AnonMessangerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NewsDrawer(drawerIndex: 6, changeIndex: (index) {}),
      appBar: AppBar(),
      body: ListView(
        children: [
          const AnonMessagengerHeader(),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SearchButton(),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: AnimateList(
              delay: 100.ms,
              interval: 50.ms,
              effects: [
                FadeEffect(
                  duration: 600.ms,
                  curve: Curves.fastEaseInToSlowEaseOut,
                ),
                SlideEffect(
                  duration: 600.ms,
                  curve: Curves.fastEaseInToSlowEaseOut,
                  begin: const Offset(-1, 0),
                ),
              ],
              children: [
                AnonChatList(
                  headerText: 'Активные',
                  chatList: TestUsers.anonChats,
                  icon: Ionicons.flame_sharp,
                  iconColor: Colors.orange[600],
                  chatStatus: 'Активен',
                ),
                const SizedBox(
                  height: 10,
                ),
                AnonChatList(
                  headerText: 'Поиск собеседника',
                  chatList: TestUsers.anonChats,
                  icon: Ionicons.walk_sharp,
                  iconColor: Colors.blue[600],
                  chatStatus: 'Ждем собеседника',
                ),
                const SizedBox(
                  height: 10,
                ),
                AnonChatList(
                  headerText: 'Не активные',
                  chatList: TestUsers.anonChats,
                  icon: Ionicons.flash_off_sharp,
                  iconColor: Colors.yellow[600],
                  chatStatus: 'Завершен',
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
