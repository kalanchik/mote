import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class AllDateButton extends StatelessWidget {
  final void Function() openSheet;
  const AllDateButton({super.key, required this.openSheet});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: openSheet,
      child: Container(
        margin: const EdgeInsets.only(bottom: 40),
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Icon(
            Ionicons.heart,
            size: 35,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
