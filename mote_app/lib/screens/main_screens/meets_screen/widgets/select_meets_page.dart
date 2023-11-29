import 'package:flutter/cupertino.dart';

class SelectMeetsPage extends StatelessWidget {
  final int? index;
  final void Function(int? value) onChange;
  const SelectMeetsPage({super.key, this.index, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          width: 350,
          child: CupertinoSlidingSegmentedControl<int>(
            padding: const EdgeInsets.all(6),
            children: {
              0: _buildSegment('Мои'),
              1: _buildSegment('Найти'),
              2: _buildSegment('Создать'),
            },
            groupValue: index,
            onValueChanged: onChange,
          ),
        ),
      ],
    );
  }
}

Widget _buildSegment(String text) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 16,
      ),
    ),
  );
}
