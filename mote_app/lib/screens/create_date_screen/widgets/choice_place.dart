import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mote_app/screens/create_date_screen/widgets/choice_place_dialog.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class ChoicePlace extends StatelessWidget {
  final void Function(Point point) setPlace;
  const ChoicePlace({super.key, required this.setPlace});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Выбери место встречи',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => ChoicePlaceDialog(
                setPlace: setPlace,
              ),
            );
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
                  Ionicons.pin_outline,
                  color: Colors.white,
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
        ),
      ],
    );
  }
}
