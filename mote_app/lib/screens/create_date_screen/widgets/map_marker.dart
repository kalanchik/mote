import 'package:flutter/material.dart';
import 'package:mote_app/models/constants.dart';

class MarkerButton extends StatelessWidget {
  final void Function() onTap;
  const MarkerButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 30,
              child: Column(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Image.asset('${Constants.imagePath}mote_logo.png'),
                    ),
                  ),
                  Container(
                    height: 20,
                    width: 2,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
