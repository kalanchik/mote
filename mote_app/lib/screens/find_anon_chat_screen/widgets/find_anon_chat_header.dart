import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

class FindAnonChatHeader extends StatelessWidget {
  const FindAnonChatHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Поиск чата',
            style: theme.textTheme.headlineLarge,
          ),
          Container(
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
                Ionicons.filter_outline,
                color: TSetColor.buttonTextColor(context),
              ),
            ),
          )
        ],
      ),
    );
  }
}
