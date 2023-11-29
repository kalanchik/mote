import 'package:flutter/material.dart';
import 'package:mote_app/utils/constants/color_pallete.dart';
import 'package:mote_app/utils/theme/theme.dart';

class UploadImageButton extends StatelessWidget {
  final void Function() onTap;
  final IconData icon;
  const UploadImageButton({
    super.key,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).primaryColor,
        ),
        child: Icon(
          icon,
          color:
              isLight(context) ? TColor.lightBackground : TColor.darkBackground,
        ),
      ),
    );
  }
}
