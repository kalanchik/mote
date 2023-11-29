import 'package:flutter/material.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

class DrawerTile extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final void Function() onTap;
  const DrawerTile({
    super.key,
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 800),
      curve: Curves.fastEaseInToSlowEaseOut,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: isSelected ? Theme.of(context).primaryColor : Colors.transparent,
      ),
      child: ListTile(
        style: ListTileStyle.drawer,
        onTap: onTap,
        leading: Icon(
          icon,
          color: isSelected
              ? TSetColor.buttonTextColor(context)
              : TSetColor.textColor(context),
        ),
        title: Text(
          label,
          style: TextStyle(
            color: isSelected
                ? TSetColor.buttonTextColor(context)
                : TSetColor.textColor(context),
          ),
        ),
      ),
    );
  }
}
