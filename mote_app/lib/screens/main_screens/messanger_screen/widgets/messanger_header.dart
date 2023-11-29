import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mote_app/router/router.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

class MessangerHeader extends StatelessWidget {
  const MessangerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Мессенджер',
          style: theme.textTheme.headlineLarge,
        ),
        Row(
          children: [
            const SizedBox(
              width: 8,
            ),
            InkWell(
              onTap: () {
                context.router.push(const CreateChatRoute());
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: [
                      Colors.red,
                      Theme.of(context).primaryColor,
                    ],
                  ),
                ),
                child: Center(
                  child: Icon(
                    Ionicons.add_sharp,
                    color: TSetColor.buttonTextColor(context),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
