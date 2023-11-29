import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

class SavePosButton extends StatelessWidget {
  final void Function() onTap;
  const SavePosButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 300,
        decoration: BoxDecoration(
          color: TSetColor.onBackgroundColor(context),
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Выбрать',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Icon(
              Ionicons.chevron_forward_outline,
            )
          ],
        )),
      ),
    );
  }
}
