import 'package:flutter/material.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

class MapHeader extends StatelessWidget {
  final String headerText;
  const MapHeader({super.key, required this.headerText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 50,
      decoration: BoxDecoration(
        color: TSetColor.onBackgroundColor(context),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          headerText,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
