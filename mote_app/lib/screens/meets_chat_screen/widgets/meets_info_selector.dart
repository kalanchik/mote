import 'package:flutter/material.dart';

class MeetsInfoSelector extends StatelessWidget {
  final void Function(int index) changeContent;
  const MeetsInfoSelector({super.key, required this.changeContent});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25),
            ),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          width: MediaQuery.of(context).size.width * 0.9,
          child: DefaultTabController(
            length: 3,
            child: TabBar(
              onTap: (index) {
                changeContent(index);
              },
              dividerHeight: 0,
              indicatorColor: Theme.of(context).primaryColor,
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
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.w400,
              ),
              tabs: [
                const Tab(
                  child: Text('Участники'),
                ),
                const Tab(
                  child: Text('Медиа'),
                ),
                const Tab(
                  child: Text('История'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
