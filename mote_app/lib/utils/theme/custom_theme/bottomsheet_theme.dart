import 'package:flutter/material.dart';
import 'package:mote_app/utils/constants/color_pallete.dart';

class TBottonSheetTheme {
  TBottonSheetTheme._();

  static BottomSheetThemeData lightBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: TColor.lightBackground,
    modalBackgroundColor: TColor.lightBackground,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
  );

  static BottomSheetThemeData darkBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: TColor.darkBackground,
    modalBackgroundColor: TColor.darkBackground,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
  );
}
