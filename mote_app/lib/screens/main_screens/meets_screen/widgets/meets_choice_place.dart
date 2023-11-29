import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mote_app/screens/create_date_screen/widgets/choice_place_dialog.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MeetsChoicePlace extends StatelessWidget {
  final void Function(Point selectedPlace) setPlace;
  final Point? choicePlace;
  const MeetsChoicePlace({super.key, required this.setPlace, this.choicePlace});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Место встречи',
                style: theme.textTheme.headlineSmall,
              ),
              Container(
                width: 100,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => ChoicePlaceDialog(
                        setPlace: setPlace,
                      ),
                    );
                  },
                  child: Text(
                    choicePlace != null ? 'Изменить' : 'Добавить',
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                choicePlace != null
                    ? 'Место встречи добавлено'
                    : 'Место встречи не выбрано',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              Icon(
                choicePlace != null
                    ? Ionicons.checkmark_outline
                    : Ionicons.alert_circle_outline,
                color: choicePlace != null ? Colors.green : Colors.red,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
