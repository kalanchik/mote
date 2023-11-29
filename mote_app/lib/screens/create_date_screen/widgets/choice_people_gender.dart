import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

class ChoicePeopleGender extends StatelessWidget {
  final void Function(String gender) setGender;
  const ChoicePeopleGender({super.key, required this.setGender});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'C кем хочешь пойти?',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: TSetColor.backgroundColor(context),
            borderRadius: BorderRadius.circular(15),
          ),
          child: DropdownMenu(
            textStyle: const TextStyle(
              fontSize: 13,
            ),
            onSelected: (value) {
              if (value != null) {
                setGender(value);
              }
            },
            menuStyle: const MenuStyle(),
            inputDecorationTheme: const InputDecorationTheme(
              contentPadding: EdgeInsets.symmetric(horizontal: 15),
              border: InputBorder.none,
            ),
            width: 150,
            dropdownMenuEntries: [
              const DropdownMenuEntry(
                value: 'Парень',
                label: 'С парнем',
                leadingIcon: Icon(
                  Ionicons.man_outline,
                ),
              ),
              const DropdownMenuEntry(
                value: 'Девушку',
                label: 'С девушкой',
                leadingIcon: Icon(Ionicons.woman_outline),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
