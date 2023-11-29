import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';


class SettingsTile extends StatelessWidget {
  final String labelText;
  final VoidCallback onTap;
  const SettingsTile({super.key, required this.labelText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              labelText,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
            GestureDetector(
              onTap: onTap,
              child: const Icon(
                Ionicons.chevron_forward,
                color: Colors.grey,
                size: 25,
              ),
            )
          ],
        ),
      ),
    );
  }
}
