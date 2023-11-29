import 'package:flutter/material.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

class PrivacyTile extends StatelessWidget {
  final String paramName;
  final List<DropdownMenuEntry<String>> items;
  final String initialItem;
  const PrivacyTile(
      {super.key,
      required this.paramName,
      required this.items,
      required this.initialItem});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Text(
            paramName,
            style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
        Container(
          width: 150,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: TSetColor.onBackgroundColor(context),
            borderRadius: BorderRadius.circular(15),
          ),
          child: DropdownMenu<String>(
            dropdownMenuEntries: [
              ...items,
            ],
            inputDecorationTheme: const InputDecorationTheme(
              enabledBorder: InputBorder.none,
              outlineBorder: BorderSide.none,
            ),
            initialSelection: initialItem,
          ),
        ),
      ],
    );
  }
}
