import 'package:flutter/material.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

class DateSelector extends StatelessWidget {
  final void Function(int index) onTap;
  const DateSelector({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: TabBar(
        dividerHeight: 0,
        indicatorSize: TabBarIndicatorSize.tab,
        overlayColor: MaterialStateProperty.all(
          Colors.transparent,
        ),
        onTap: onTap,
        indicator: BoxDecoration(
          color: TSetColor.onBackgroundColor(context),
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(15),
          ),
        ),
        labelColor: TSetColor.textColor(context),
        labelStyle: const TextStyle(
          fontSize: 18,
        ),
        unselectedLabelColor: Colors.grey,
        tabs: [
          const Tab(
            text: 'Вслепую',
          ),
          const Tab(
            text: 'Обычное',
          ),
        ],
      ),
    );
  }
}
