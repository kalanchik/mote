import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mote_app/screens/main_screens/map_screen/widgets/my_date_card.dart';

class AllDateSheetFind extends StatelessWidget {
  const AllDateSheetFind({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Row(
              children: <Widget>[
                Icon(
                  Ionicons.flame_sharp,
                  color: Colors.orange[600],
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  'Доступные свидания',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const MyDateCard(
              isAnon: false,
            ),
            const MyDateCard(
              isAnon: true,
            ),
            const MyDateCard(
              isAnon: false,
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
