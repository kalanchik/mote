import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mote_app/screens/main_screens/map_screen/widgets/my_date_card.dart';

class AllDateSheetMyDate extends StatelessWidget {
  const AllDateSheetMyDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Icon(
                  Ionicons.heart_sharp,
                  color: Colors.red[400],
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  'Мои свидания',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
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
