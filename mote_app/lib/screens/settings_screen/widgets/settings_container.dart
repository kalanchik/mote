import 'package:flutter/material.dart';

class SettingsContainer extends StatelessWidget {
  final String headerText;
  final IconData iconData;
  final List<Widget> children;
  const SettingsContainer({super.key, required this.headerText, required this.iconData, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(
              iconData,
              size: 25,
            ),
            const SizedBox(width: 5,),
            Text(
              headerText,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10,),
        const Divider(),
        const SizedBox(height: 10,),
        ...children,
      ],
    );
  }
}
