import 'package:flutter/material.dart';
import 'package:mote_app/utils/constants/color_pallete.dart';
import 'package:mote_app/utils/theme/custom_theme/appbar_theme.dart';
import 'package:mote_app/utils/theme/custom_theme/bottomsheet_theme.dart';
import 'package:mote_app/utils/theme/custom_theme/checkbox_theme.dart';
import 'package:mote_app/utils/theme/custom_theme/elevated_button.dart';
import 'package:mote_app/utils/theme/custom_theme/outlinebutton_theme.dart';
import 'package:mote_app/utils/theme/custom_theme/text_theme.dart';
import 'package:mote_app/utils/theme/custom_theme/textformfield_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'FiraSans',
    primaryColor: TColor.lightPrimary,
    scaffoldBackgroundColor: TColor.lightBackground,
    textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: TBottonSheetTheme.lightBottomSheetTheme,
    checkboxTheme: TCheckBoxTheme.lightCheckBoxTheme,
    outlinedButtonTheme: TOutlineButtonTheme.lightOutlineButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightTextFormTheme,
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'FiraSans',
    primaryColor: TColor.darkPrimary,
    scaffoldBackgroundColor: TColor.darkBackground,
    textTheme: TTextTheme.darkTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    checkboxTheme: TCheckBoxTheme.darkCheckBoxTheme,
    bottomSheetTheme: TBottonSheetTheme.darkBottomSheetTheme,
    outlinedButtonTheme: TOutlineButtonTheme.darkOutlineButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkTextFormTheme,
  );
}

bool isLight(BuildContext context) {
  final theme = Theme.of(context);
  return theme.brightness == Brightness.light;
}
