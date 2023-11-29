import 'package:flutter/material.dart';
import 'package:mote_app/models/constants.dart';

class AllDateSheetHeader extends StatelessWidget {
  const AllDateSheetHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
          bottom: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 12,
            ),
            Center(
              child: Container(
                height: 5,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[100],
                  ),
                  child: Image.asset(
                    '${Constants.imagePath}mote_logo.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Meet by mote',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          // InkWell(
                          //   onTap: () {
                          //     Navigator.of(context).pop();
                          //   },
                          //   child: Container(
                          //     width: 30,
                          //     height: 30,
                          //     child: const Icon(
                          //       Ionicons.close_outline,
                          //       color: Colors.grey,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                      const Row(
                        children: <Widget>[
                          Text(
                            'Сейчас доступно 100 свиданий',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
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
