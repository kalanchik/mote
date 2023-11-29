import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class MenuTile extends StatelessWidget {
  final String name;
  final IoniconsData icon;
  final VoidCallback onTap;
  const MenuTile({
    super.key,
    required this.name,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(
              icon,
              size: 25,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              name,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
