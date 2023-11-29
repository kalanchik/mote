import 'package:flutter/material.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

class AgeChoice extends StatefulWidget {
  const AgeChoice({super.key});

  @override
  State<AgeChoice> createState() => _AgeChoiceState();
}

class _AgeChoiceState extends State<AgeChoice> {
  RangeValues rangeValues = const RangeValues(20.0, 23.0);

  @override
  Widget build(BuildContext context) {
    var rangeLabels = RangeLabels(
      rangeValues.start.toString(),
      rangeValues.end.toString(),
    );
    final theme = Theme.of(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Возрасрт собеседника',
              style: theme.textTheme.headlineSmall,
            ),
            Text(
              '${rangeValues.start.toInt()}-${rangeValues.end.toInt()}',
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              child: Column(
                children: [
                  RangeSlider(
                    activeColor: Theme.of(context).primaryColor,
                    inactiveColor: TSetColor.onBackgroundColor(context),
                    min: 1.0,
                    max: 100.0,
                    labels: rangeLabels,
                    values: rangeValues,
                    onChanged: (value) {
                      setState(() {
                        rangeValues = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
