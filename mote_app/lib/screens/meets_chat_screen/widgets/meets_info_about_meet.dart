import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class MeetsInfoAboutMeet extends StatelessWidget {
  final String meetDesc;
  final String meetPlace;
  final String meetDate;
  const MeetsInfoAboutMeet({
    super.key,
    required this.meetDesc,
    required this.meetPlace,
    required this.meetDate,
  });

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'О встрече',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                  ),
                ),
                GestureDetector(
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
                    child: const Center(
                      child: Text(
                        'На карте',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Ionicons.newspaper_outline,
                  color: Colors.black,
                ),
                const SizedBox(
                  width: 8,
                ),
                Flexible(
                  child: Text(
                    meetDesc,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Icon(
                  Ionicons.business_outline,
                  color: Colors.black,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  meetPlace,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Icon(
                  Ionicons.calendar_number_outline,
                  color: Colors.black,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  '$meetDate в 11:00',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ],
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
