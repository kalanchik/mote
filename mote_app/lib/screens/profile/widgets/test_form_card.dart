import 'package:flutter/material.dart';
import 'package:mote_app/utils/constants/color_pallete.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';
import 'package:mote_app/utils/theme/theme.dart';

class TestFormCard extends StatelessWidget {
  final String labelText;
  final IconData iconData;
  const TestFormCard(
      {super.key, required this.labelText, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
      decoration: BoxDecoration(
        color: isLight(context) ? TColor.lightSecondary : TColor.darktAccent,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            color: TSetColor.textColor(context),
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            child: Text(labelText),
          ),
        ],
      ),
    );
  }
}
