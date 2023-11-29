import 'package:flutter/material.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

class MyAge extends StatelessWidget {
  final int index;
  final void Function(int newIndex) changeIndex;
  const MyAge({
    super.key,
    required this.index,
    required this.changeIndex,
  });

  @override
  Widget build(BuildContext context) {
    final buttonText = <String>[
      'Скрыть',
      'Показать',
    ];
    final headerText = <String>[
      'Скрыть твой возраст?',
      'Показывать твой возраст?',
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          headerText[index],
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        GestureDetector(
          onTap: () {
            var newIndex = index;
            if (index < buttonText.length - 1) {
              newIndex += 1;
            }
            if (index >= buttonText.length - 1) {
              newIndex = 0;
            }
            changeIndex(newIndex);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 7,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              buttonText[index],
              style: TextStyle(
                color: TSetColor.buttonTextColor(context),
                fontSize: 15,
              ),
            ),
          ),
        )
      ],
    );
  }
}
