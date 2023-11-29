import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mote_app/screens/pass_screen/widgets/by_pass_content.dart';
import 'package:mote_app/screens/pass_screen/widgets/my_pacc_content.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

@RoutePage()
class PassScreen extends StatefulWidget {
  const PassScreen({super.key});

  @override
  State<PassScreen> createState() => _PassScreenState();
}

class _PassScreenState extends State<PassScreen> {
  @override
  void initState() {
    super.initState();
  }

  final contentList = <Widget>[
    const ByPassContent(),
    const MyPassContent(),
  ];

  int contentIndex = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: TSetColor.backgroundColor(context),
    ));
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Подписка',
                    style: theme.textTheme.headlineLarge,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: DefaultTabController(
                      length: 2,
                      child: TabBar(
                        onTap: (value) {
                          setState(() {
                            contentIndex = value;
                          });
                        },
                        labelStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                        unselectedLabelStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                        labelColor: TSetColor.textColor(context),
                        unselectedLabelColor: Colors.grey,
                        indicatorWeight: 3,
                        indicatorColor: Theme.of(context).primaryColor,
                        tabs: [
                          const Tab(
                            text: 'Предложения',
                          ),
                          const Tab(
                            text: 'Мои подписки',
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: TSetColor.onBackgroundColor(context),
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        child: contentList[contentIndex],
      ),
    );
  }
}
