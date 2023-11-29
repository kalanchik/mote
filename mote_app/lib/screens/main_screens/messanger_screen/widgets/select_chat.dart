import 'package:flutter/cupertino.dart';

class SelectChat extends StatefulWidget {
  final int contentIndex;
  final void Function(int? index) onChange;
  const SelectChat(
      {super.key, required this.contentIndex, required this.onChange});

  @override
  State<SelectChat> createState() => _SelectChatState();
}

class _SelectChatState extends State<SelectChat> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 350,
          child: CupertinoSlidingSegmentedControl<int>(
            padding: const EdgeInsets.all(10),
            children: {
              0: buildSegment('Все'),
              1: buildSegment('Чаты'),
              2: buildSegment('Анонимные'),
            },
            groupValue: widget.contentIndex,
            onValueChanged: (value) {
              widget.onChange(value);
            },
          ),
        ),
      ],
    );
  }
}

Widget buildSegment(String text) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 15,
      ),
    ),
  );
}
