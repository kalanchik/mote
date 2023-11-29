import 'package:flutter/material.dart';
import 'package:mote_app/models/constants.dart';

class AppBarHeader extends StatelessWidget {
  const AppBarHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'mote',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 32,
            fontWeight: FontWeight.w600,
          ),
        ),
        Container(
          height: 60,
          width: 60,
          child: Image.asset('${Constants.imagePath}mote_logo.png'),
        ),
      ],
    );
  }
}
