import 'package:flutter/material.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

class ProfileInfoCard extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final String label;
  const ProfileInfoCard({
    super.key,
    required this.icon,
    required this.label,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: TSetColor.onBackgroundColor(context),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: iconColor,
            size: 15,
          ),
          const SizedBox(
            width: 3,
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
