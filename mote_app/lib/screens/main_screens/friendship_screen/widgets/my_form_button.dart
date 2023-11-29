import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mote_app/router/router.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

class MyFormButton extends StatelessWidget {
  const MyFormButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        decoration: const BoxDecoration(),
        child: ElevatedButton(
          onPressed: () {
            AutoRouter.of(context).push(const ProfileRoute());
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Моя анкета',
                style: TextStyle(
                  color: TSetColor.buttonTextColor(context),
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Icon(
                Ionicons.person_outline,
                size: 30,
                color: TSetColor.buttonTextColor(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
