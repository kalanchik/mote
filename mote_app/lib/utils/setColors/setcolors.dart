import 'package:flutter/material.dart';
import 'package:mote_app/utils/constants/color_pallete.dart';

class TSetColor {
  TSetColor._();
  static bool _isLight(BuildContext context) {
    final theme = Theme.of(context);
    return theme.brightness == Brightness.light;
  }

  static Color backgroundColor(BuildContext context) {
    return _isLight(context) ? TColor.lightBackground : TColor.darkBackground;
  }

  static Color onBackgroundColor(BuildContext context) {
    return _isLight(context) ? TColor.lightGrey : TColor.darkGrey;
  }

  static Color buttonColor(BuildContext context) {
    return _isLight(context) ? TColor.lightPrimary : TColor.darkPrimary;
  }

  static Color textColor(BuildContext context) {
    return _isLight(context) ? TColor.lightText : TColor.darkText;
  }

  static Color buttonTextColor(BuildContext context) {
    return _isLight(context) ? TColor.lightBackground : TColor.darkBackground;
  }

  static Color accentColor(BuildContext context) {
    return _isLight(context) ? TColor.lightAccent : TColor.darktAccent;
  }
}
