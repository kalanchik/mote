import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mote_app/router/router.dart';

class ViewFormsButton extends StatelessWidget {
  const ViewFormsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AutoRouter.of(context).push(const DatingRoute());
      },
      child: Container(
        width: 155,
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              Colors.red,
              Theme.of(context).primaryColor,
            ],
          ),
        ),
        child: const Row(
          children: [
            Text(
              'Смотреть анкеты',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            Icon(
              Ionicons.play_outline,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
