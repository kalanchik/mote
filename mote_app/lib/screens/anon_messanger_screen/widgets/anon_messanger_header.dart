import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mote_app/router/router.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

class AnonMessagengerHeader extends StatelessWidget {
  const AnonMessagengerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              'Анонимный чат',
              overflow: TextOverflow.clip,
              style: theme.textTheme.headlineLarge,
            ),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  AutoRouter.of(context).push(
                    const FindAnonChatRoute(),
                  );
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
                  child: Icon(
                    Ionicons.search_sharp,
                    color: TSetColor.buttonTextColor(context),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  AutoRouter.of(context).push(
                    const CreateAnonChatRoute(),
                  );
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
                  child: Icon(
                    Ionicons.add_sharp,
                    color: TSetColor.buttonTextColor(context),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
