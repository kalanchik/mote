import 'package:flutter/material.dart';
import 'package:mote_app/utils/constants/color_pallete.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: TColor.lightBackground,
      backgroundColor: TColor.lightPrimary,
      disabledBackgroundColor: TColor.lightGrey,
      disabledForegroundColor: TColor.lightGrey,
      side: const BorderSide(width: 0, color: Colors.transparent),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(
        fontSize: 16,
        color: TColor.whiteText,
        fontWeight: FontWeight.w500,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: TColor.darkBackground,
      backgroundColor: TColor.darkPrimary,
      disabledBackgroundColor: TColor.darkGrey,
      disabledForegroundColor: TColor.darkGrey,
      side: const BorderSide(width: 0, color: Colors.transparent),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(
        fontSize: 16,
        color: TColor.whiteText,
        fontWeight: FontWeight.w500,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}
