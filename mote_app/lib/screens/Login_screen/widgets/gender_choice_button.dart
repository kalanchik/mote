import 'package:flutter/material.dart';
import 'package:mote_app/utils/constants/color_pallete.dart';

class GenderChoiceButton extends StatelessWidget {
  final void Function(int index) changeGender;
  final int Function() getGender;

  const GenderChoiceButton({
    super.key,
    required this.changeGender,
    required this.getGender,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: isLight(context) ? TColor.lightGrey : TColor.darkGrey,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () => changeGender(1),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: isSelected(getGender(), 1)
                      ? isLight(context)
                          ? TColor.lightContainerSecondary
                          : TColor.darkContainerSecondary
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(
                  Icons.man,
                  color: isSelected(getGender(), 1)
                      ? isLight(context)
                          ? TColor.lightSecondary
                          : TColor.darktAccent
                      : isLight(context)
                          ? TColor.lightText
                          : TColor.darkText,
                  size: 35,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => changeGender(2),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: isSelected(getGender(), 2)
                      ? isLight(context)
                          ? TColor.lightContainerSecondary
                          : TColor.darkContainerSecondary
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(
                  Icons.woman,
                  color: isSelected(getGender(), 2)
                      ? isLight(context)
                          ? TColor.lightSecondary
                          : TColor.darktAccent
                      : isLight(context)
                          ? TColor.lightText
                          : TColor.darkText,
                  size: 35,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool isLight(BuildContext context) {
    final theme = Theme.of(context);
    return theme.brightness == Brightness.light;
  }
}

bool isSelected(int index, int value) {
  return index == value;
}
