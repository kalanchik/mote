import 'package:flutter/material.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';
import 'package:quickalert/quickalert.dart';

class TQuickAlert {
  TQuickAlert._();
  static void showQuickAlert({
    required BuildContext context,
    required QuickAlertType type,
    required String text,
    required String title,
    String? confrimButton,
    void Function()? onTap,
  }) {
    final theme = Theme.of(context);
    if (type == QuickAlertType.success) {
      QuickAlert.show(
        context: context,
        type: type,
        title: title,
        text: text,
        textColor: TSetColor.textColor(context),
        confirmBtnColor: TSetColor.buttonColor(context),
        backgroundColor: TSetColor.backgroundColor(context),
        confirmBtnText: confrimButton!,
        barrierDismissible: false,
        confirmBtnTextStyle: theme.textTheme.bodyLarge!.copyWith(
          color: TSetColor.buttonTextColor(context),
        ),
        onConfirmBtnTap: onTap,
      );
      return;
    }
  }
}
