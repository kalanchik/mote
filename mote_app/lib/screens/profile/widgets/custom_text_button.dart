import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String labelText;
  final void Function() onPressed;
  final Color? buttonColor;
  const CustomTextButton({super.key, required this.labelText, required this.onPressed, required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(buttonColor),
        overlayColor: MaterialStateProperty.all(buttonColor!.withOpacity(0.4),),
      ),
      onPressed: onPressed,
      child: Text(
        labelText,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
