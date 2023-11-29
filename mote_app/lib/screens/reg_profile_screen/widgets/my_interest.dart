import 'package:flutter/material.dart';
import 'package:mote_app/utils/constants/color_pallete.dart';
import 'package:mote_app/utils/theme/theme.dart';

class MyInterest extends StatelessWidget {
  final List<String> items;
  const MyInterest({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Wrap(
      spacing: 5.0,
      runSpacing: 10.0,
      children: [
        ...List<Widget>.generate(
          items.length,
          (index) => Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color:
                  isLight(context) ? TColor.lightSecondary : TColor.darktAccent,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              items[index],
              style: theme.textTheme.bodyLarge!.copyWith(
                color: isLight(context) ? TColor.lightText : TColor.darkText,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
