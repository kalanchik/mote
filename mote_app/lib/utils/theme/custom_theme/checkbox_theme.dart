import 'package:flutter/material.dart';
import 'package:mote_app/utils/constants/color_pallete.dart';

class TCheckBoxTheme {
  TCheckBoxTheme._();

  static final lightCheckBoxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: MaterialStateProperty.resolveWith(
      (states) {
        if (states.contains(MaterialState.selected)) {
          return TColor.lightBackground;
        } else {
          return TColor.lightText;
        }
      },
    ),
    fillColor: MaterialStateProperty.resolveWith(
      (states) {
        if (states.contains(MaterialState.selected)) {
          return TColor.lightPrimary;
        } else {
          return Colors.transparent;
        }
      },
    ),
  );

  static final darkCheckBoxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: MaterialStateProperty.resolveWith(
      (states) {
        if (states.contains(MaterialState.selected)) {
          return TColor.darkBackground;
        } else {
          return TColor.darkText;
        }
      },
    ),
    fillColor: MaterialStateProperty.resolveWith(
      (states) {
        if (states.contains(MaterialState.selected)) {
          return TColor.darkPrimary;
        } else {
          return Colors.transparent;
        }
      },
    ),
  );
}
