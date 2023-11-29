import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

class AccountSaveButton extends StatelessWidget {
  const AccountSaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Ionicons.save_outline,
            color: TSetColor.buttonTextColor(context),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            'Сохранить',
            style: TextStyle(
              color: TSetColor.buttonTextColor(context),
            ),
          )
        ],
      ),
    );
  }
}
