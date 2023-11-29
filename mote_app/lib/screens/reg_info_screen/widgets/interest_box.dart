import 'package:flutter/material.dart';
import 'package:mote_app/utils/constants/color_pallete.dart';
import 'package:mote_app/utils/theme/theme.dart';

class InterestBox extends StatefulWidget {
  final String label;
  final void Function() onTap;
  final bool Function() isSelected;
  const InterestBox({
    super.key,
    required this.label,
    required this.onTap,
    required this.isSelected,
  });

  @override
  State<InterestBox> createState() => _InterestBoxState();
}

class _InterestBoxState extends State<InterestBox> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.onTap();
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        constraints: const BoxConstraints(),
        decoration: BoxDecoration(
          color: widget.isSelected()
              ? isLight(context)
                  ? TColor.lightSecondary
                  : TColor.darktAccent
              : isLight(context)
                  ? TColor.lightGrey
                  : TColor.darkGrey,
          border: Border.all(
            color: widget.isSelected()
                ? isLight(context)
                    ? TColor.lightSecondary
                    : TColor.darktAccent
                : isLight(context)
                    ? TColor.lightGrey
                    : TColor.darkGrey,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 4, top: 5, bottom: 5, right: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.label,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: widget.isSelected()
                      ? isLight(context)
                          ? TColor.lightText
                          : TColor.darkText
                      : isLight(context)
                          ? TColor.lightAccent
                          : TColor.darktAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
