import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class CreateDateInfo extends StatelessWidget {
  final String? gender;
  final Point? place;
  final DateTime? date;
  final TimeOfDay? time;
  final int dateIndex;
  final TextEditingController descController;
  const CreateDateInfo({
    super.key,
    this.gender,
    this.place,
    this.date,
    this.time,
    required this.dateIndex,
    required this.descController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: TSetColor.onBackgroundColor(context),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  dateIndex == 0 ? 'Свидание вслепую' : 'Обычное свидание',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            dateIndex == 0
                ? const SizedBox.shrink()
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Icon(
                        Ionicons.person_outline,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 120,
                        child: const Text(
                          'Профиль',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Icon(
                        Ionicons.checkmark_outline,
                        color: Colors.green,
                      )
                    ],
                  ),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Icon(
                  Ionicons.people_outline,
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 120,
                  child: const Text(
                    'Партнер',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Icon(
                  gender != null ? Ionicons.checkmark_outline : Ionicons.close,
                  color: gender != null ? Colors.green : Colors.red,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Icon(
                  Ionicons.home_outline,
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 120,
                  child: const Text(
                    'Место встречи',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Icon(
                  place != null ? Ionicons.checkmark_outline : Ionicons.close,
                  color: place != null ? Colors.green : Colors.red,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Icon(
                  Ionicons.calendar_number_outline,
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 120,
                  child: const Text(
                    'Дата встречи',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Icon(
                  date != null ? Ionicons.checkmark_outline : Ionicons.close,
                  color: date != null ? Colors.green : Colors.red,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Icon(
                  Ionicons.time_outline,
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 120,
                  child: const Text(
                    'Время встречи',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Icon(
                  time != null ? Ionicons.checkmark_outline : Ionicons.close,
                  color: time != null ? Colors.green : Colors.red,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Icon(
                  Ionicons.clipboard_outline,
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 120,
                  child: const Text(
                    'Описание',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Icon(
                  descController.text.isNotEmpty
                      ? Ionicons.checkmark_outline
                      : Ionicons.close,
                  color: descController.text.trim().isNotEmpty
                      ? Colors.green
                      : Colors.red,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
