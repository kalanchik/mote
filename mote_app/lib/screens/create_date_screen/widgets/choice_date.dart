import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ChoiceDate extends StatelessWidget {
  final void Function(DateTime newDate) setDate;
  const ChoiceDate({super.key, required this.setDate});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Выбери дату',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
        GestureDetector(
          onTap: () async {
            var date = await showDatePicker(
                builder: (context, child) => Theme(
                      data: ThemeData().copyWith(
                        colorScheme: ColorScheme.dark(
                          onPrimary: Colors.red,
                          surface: Theme.of(context).primaryColor,
                          primary: Colors.white,
                          onSurface: Colors.white,
                        ),
                      ),
                      child: child!,
                    ),
                initialEntryMode: DatePickerEntryMode.input,
                locale: const Locale('ru', 'RU'),
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2024, 1, 1));
            if (date != null) {
              setDate(date);
            }
          },
          child: Container(
            height: 35,
            width: 100,
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
                  Ionicons.calendar_number_outline,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 4,
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
