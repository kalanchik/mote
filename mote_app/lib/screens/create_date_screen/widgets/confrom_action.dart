import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class ConfrimAction extends StatelessWidget {
  final void Function() onBack;
  final void Function(Point point) onSave;
  final Point? choicePlace;
  const ConfrimAction(
      {super.key,
      required this.onBack,
      required this.onSave,
      required this.choicePlace});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onBack,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.35,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.red[400],
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Ionicons.trash_outline,
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (choicePlace != null) {
                onSave(choicePlace!);
                Navigator.of(context).pop();
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.35,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Center(
                child: Icon(
                  Ionicons.checkmark_outline,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
