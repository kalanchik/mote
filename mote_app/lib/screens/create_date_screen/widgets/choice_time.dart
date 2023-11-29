import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ChoiceTime extends StatelessWidget {
  final void Function(TimeOfDay time) setTime;
  const ChoiceTime({super.key, required this.setTime});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Выбери время',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        GestureDetector(
          onTap: () async {
            var time = await showTimePicker(
              builder: (context, child) => Theme(
                data: ThemeData(),
                child: child!,
              ),
              initialEntryMode: TimePickerEntryMode.input,
              context: context,
              initialTime: TimeOfDay.now(),
            );
            if (time != null) {
              setTime(time);
            }
          },
          child: Container(
            width: 100,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                colors: [
                  Colors.red,
                  Theme.of(context).primaryColor,
                ],
              ),
            ),
            child: const Row(
              children: [
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Ionicons.time_outline,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Выбрать',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
