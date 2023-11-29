import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mote_app/router/router.dart';

class AnonButtons extends StatelessWidget {
  const AnonButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            AutoRouter.of(context).push(const FindAnonChatRoute());
          },
          child: Container(
            width: 125,
            padding: const EdgeInsets.symmetric(
              vertical: 13,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Center(
              child: Text(
                'Найти',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            AutoRouter.of(context).push(const CreateAnonChatRoute());
          },
          child: Container(
            width: 125,
            padding: const EdgeInsets.symmetric(
              vertical: 13,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Center(
              child: Text(
                'Создать',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
