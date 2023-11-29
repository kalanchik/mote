import 'package:flutter/material.dart';
import 'package:mote_app/utils/constants/color_pallete.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  static final lightTextFormTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: TColor.lightGrey,
    suffixIconColor: TColor.lightGrey,
    labelStyle: const TextStyle().copyWith(
      fontSize: 14,
      color: TColor.lightText,
    ),
    hintStyle: const TextStyle().copyWith(
      fontSize: 14,
      color: TColor.lightText,
    ),
    errorStyle: const TextStyle().copyWith(
      fontStyle: FontStyle.normal,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(
        width: 3,
        color: TColor.lightGrey,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(
        width: 3,
        color: TColor.lightGrey,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(
        width: 3,
        color: TColor.lightSecondary,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(
        width: 3,
        color: TColor.lightPrimary,
      ),
    ),
  );

  static final darkTextFormTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: TColor.darkGrey,
    suffixIconColor: TColor.darkGrey,
    labelStyle: const TextStyle().copyWith(
      fontSize: 14,
      color: TColor.darkText,
    ),
    hintStyle: const TextStyle().copyWith(
      fontSize: 14,
      color: TColor.darkText,
    ),
    errorStyle: const TextStyle().copyWith(
      fontStyle: FontStyle.normal,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(
        width: 3,
        color: TColor.darkGrey,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(
        width: 3,
        color: TColor.darkGrey,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(
        width: 3,
        color: TColor.darktAccent,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(
        width: 3,
        color: TColor.darkPrimary,
      ),
    ),
  );
}
