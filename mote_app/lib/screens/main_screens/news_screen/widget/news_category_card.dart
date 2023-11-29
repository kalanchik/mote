import 'package:flutter/material.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

class NewCategoryCard extends StatelessWidget {
  const NewCategoryCard({
    super.key,
    required this.categoryText,
    required this.icon,
    required this.onTap,
    required this.iconColor,
  });

  final String categoryText;
  final IconData icon;
  final Color? iconColor;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 90,
        width: 170,
        decoration: BoxDecoration(
          color: TSetColor.onBackgroundColor(context),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 50,
                color: iconColor,
              ),
              Text(
                categoryText,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
