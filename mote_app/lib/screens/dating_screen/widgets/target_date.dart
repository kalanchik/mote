import 'package:flutter/material.dart';

class TargetDate extends StatefulWidget {
  const TargetDate({super.key});

  @override
  State<TargetDate> createState() => _TargetDateState();
}

class _TargetDateState extends State<TargetDate> {
  List<String> items = [
    'Отношения',
    'Флирт',
    'Общение',
    'Не важно',
  ];
  String? selectedItems = 'Отношения';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Text(
              'Цель знакомства',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey,
              )),
          child: DropdownButtonFormField(
            borderRadius: BorderRadius.circular(15),
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            value: selectedItems,
            items: items
                .map((item) => DropdownMenuItem(
                      value: item,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(item),
                        ],
                      ),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedItems = value;
              });
            },
          ),
        )
      ],
    );
  }
}
