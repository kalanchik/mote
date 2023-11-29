import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mote_app/utils/constants/color_pallete.dart';
import 'package:mote_app/utils/theme/theme.dart';

class InterestButton extends StatelessWidget {
  final List<String> interests;
  const InterestButton({super.key, required this.interests});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
        color: theme.primaryColor,
        shape: BoxShape.circle,
      ),
      child: Icon(
        interests.isNotEmpty ? Iconsax.edit_2 : Iconsax.add,
        color:
            isLight(context) ? TColor.lightBackground : TColor.darkBackground,
      ),
    );
  }
}
