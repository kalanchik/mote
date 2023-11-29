import 'package:flutter/material.dart';
import 'package:mote_app/utils/constants/color_pallete.dart';

class TOutlineButtonTheme {
  TOutlineButtonTheme._();

  static final lightOutlineButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: TColor.lightText,
      side: const BorderSide(color: TColor.lightGrey, width: 2),
      textStyle: const TextStyle(
        fontSize: 16,
        color: TColor.lightText,
        fontWeight: FontWeight.w500,
      ),
      padding: const EdgeInsets.symmetric(vertical: 18),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );

  static final darkOutlineButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: TColor.darkText,
      side: const BorderSide(color: TColor.darkGrey, width: 2),
      textStyle: const TextStyle(
        fontSize: 16,
        color: TColor.darkText,
        fontWeight: FontWeight.w500,
      ),
      padding: const EdgeInsets.symmetric(vertical: 18),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}
