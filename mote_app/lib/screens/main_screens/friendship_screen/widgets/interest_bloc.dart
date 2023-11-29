import 'package:flutter/material.dart';
import 'package:mote_app/utils/constants/color_pallete.dart';
import 'package:mote_app/utils/theme/theme.dart';

class InterestBloc extends StatelessWidget {
  const InterestBloc({super.key, required this.interests});

  final List<String> interests;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                'Интересы',
                style: theme.textTheme.headlineMedium,
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Wrap(
            spacing: 5.0,
            runSpacing: 10.0,
            children: [
              ...List.generate(
                interests.length,
                (index) => Container(
                  padding: const EdgeInsets.only(
                    left: 6,
                    top: 9,
                    bottom: 9,
                    right: 20,
                  ),
                  decoration: BoxDecoration(
                    color: (index % 4) == 0
                        ? isLight(context)
                            ? TColor.lightSecondary
                            : TColor.darktAccent
                        : isLight(context)
                            ? TColor.lightGrey
                            : TColor.darkGrey,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    interests[index],
                    style: TextStyle(
                      color: (index % 4) == 0
                          ? isLight(context)
                              ? TColor.lightText
                              : TColor.darkText
                          : isLight(context)
                              ? TColor.lightAccent
                              : TColor.darktAccent,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
