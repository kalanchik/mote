import 'package:flutter/material.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

class HelpPageContoller extends StatelessWidget {
  final void Function(int index) changeIndex;
  const HelpPageContoller({super.key, required this.changeIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: TSetColor.onBackgroundColor(context),
            borderRadius: BorderRadius.circular(15),
          ),
          width: MediaQuery.of(context).size.width * 0.8,
          height: 60,
          child: DefaultTabController(
            length: 2,
            child: TabBar(
              onTap: changeIndex,
              dividerHeight: 0,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  colors: [
                    Colors.red,
                    Theme.of(context).primaryColor,
                  ],
                ),
              ),
              indicatorPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              indicatorColor: Theme.of(context).primaryColor,
              tabs: [
                const Tab(
                  text: 'Мои заявки',
                ),
                const Tab(
                  text: 'Создать заявку',
                )
              ],
              labelColor: TSetColor.buttonTextColor(context),
              unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.w400,
              ),
              unselectedLabelColor: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
