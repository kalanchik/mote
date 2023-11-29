import 'package:flutter/material.dart';
import 'package:mote_app/utils/constants/color_pallete.dart';
import 'package:mote_app/utils/theme/theme.dart';

class BottomActionButton extends StatelessWidget {
  final IconData iconData;
  final Color? backColor;
  final void Function() onTap;
  final Color textColor;
  final bool openInfo;
  final String direction;
  const BottomActionButton({
    super.key,
    required this.iconData,
    this.backColor,
    required this.onTap,
    required this.textColor,
    required this.openInfo,
    required this.direction,
  });

  @override
  Widget build(BuildContext context) {
    return direction == 'right'
        ? GestureDetector(
            onTap: onTap,
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: openInfo ? Theme.of(context).primaryColor : backColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                iconData,
                color: openInfo ? Colors.white : Colors.black,
                size: 30,
              ),
            ),
          )
        : GestureDetector(
            onTap: onTap,
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: openInfo
                    ? isLight(context)
                        ? TColor.lightSecondary
                        : TColor.lightAccent
                    : backColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                iconData,
                color: openInfo ? Colors.white : textColor,
                size: 30,
              ),
            ),
          );
  }
}
