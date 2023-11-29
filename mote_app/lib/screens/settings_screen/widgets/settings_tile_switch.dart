import 'package:flutter/material.dart';

class SettingsTileSwitch extends StatelessWidget {
  final String labelText;
  final void Function(bool value) onTap;
  final bool isActive;
  const SettingsTileSwitch({super.key, required this.labelText, required this.onTap, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
        Switch(
          activeColor: Theme.of(context).primaryColor,
            value: isActive,
            onChanged: onTap,
        ),
      ],
    );
  }
}
