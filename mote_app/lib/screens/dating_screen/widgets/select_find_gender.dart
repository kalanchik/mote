import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectFindGender extends StatefulWidget {
  const SelectFindGender({super.key});

  @override
  State<SelectFindGender> createState() => _SelectFindGenderState();
}

class _SelectFindGenderState extends State<SelectFindGender> {
  int? groupValue = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        const Row(
          children: [
            Text(
              'Кого смотрим?',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: CupertinoSlidingSegmentedControl<int>(
                children: {
                  0: buildSegment('Парней'),
                  1: buildSegment('Девушек'),
                  2: buildSegment('Не важно'),
                },
                groupValue: groupValue,
                padding: const EdgeInsets.all(4),
                onValueChanged: (value) {
                  setState(() {
                    groupValue = value;
                  });
                },
              ),
            )
          ],
        )
      ],
    );
  }
}

Widget buildSegment(String name) {
  return Container(
    padding: const EdgeInsets.all(12),
    child: Text(
      name,
      style: const TextStyle(
        fontSize: 15,
      ),
    ),
  );
}
