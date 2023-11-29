import 'package:flutter/material.dart';
import 'package:mote_app/utils/constants/color_pallete.dart';
import 'package:mote_app/utils/theme/theme.dart';

class GenderButton extends StatelessWidget {
  final String icon;
  final String label;
  final void Function() onTap;
  const GenderButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 50,
        decoration: BoxDecoration(
          color: isLight(context) ? TColor.lightGrey : TColor.darkGrey,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: icon,
                  style: theme.textTheme.headlineMedium,
                ),
                TextSpan(
                  text: label,
                  style: theme.textTheme.headlineSmall,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
