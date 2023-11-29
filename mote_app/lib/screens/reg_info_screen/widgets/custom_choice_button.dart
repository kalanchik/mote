import 'package:flutter/material.dart';
import 'package:mote_app/utils/constants/color_pallete.dart';
import 'package:mote_app/utils/theme/theme.dart';

class ChoiceSign extends StatefulWidget {
  final List<String> signs;
  final bool Function(int index) isSelected;
  final void Function(int index) onTap;
  const ChoiceSign({
    super.key,
    required this.signs,
    required this.onTap,
    required this.isSelected,
  });

  @override
  State<ChoiceSign> createState() => _ChoiceSignState();
}

class _ChoiceSignState extends State<ChoiceSign> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Wrap(
          direction: Axis.horizontal,
          spacing: 5.0,
          runSpacing: 10,
          children: [
            ...List.generate(
              widget.signs.length,
              (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    widget.onTap(index);
                  });
                },
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 10,
                    top: 8,
                    bottom: 8,
                    right: 20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: widget.isSelected(index)
                        ? isLight(context)
                            ? TColor.lightSecondary
                            : TColor.darktAccent
                        : isLight(context)
                            ? TColor.lightGrey
                            : TColor.darkGrey,
                    border: Border.all(
                      color: widget.isSelected(index)
                          ? isLight(context)
                              ? TColor.lightSecondary
                              : TColor.darktAccent
                          : isLight(context)
                              ? TColor.lightGrey
                              : TColor.darkGrey,
                    ),
                  ),
                  child: Text(
                    widget.signs[index],
                    style: theme.textTheme.bodyLarge!.copyWith(
                      color: widget.isSelected(index)
                          ? isLight(context)
                              ? TColor.lightText
                              : TColor.darkText
                          : isLight(context)
                              ? TColor.lightAccent
                              : TColor.darktAccent,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
