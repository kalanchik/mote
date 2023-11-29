import 'package:flutter/material.dart';
import 'package:mote_app/models/constants.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 10),
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('${Constants.imagePath}mote_logo.png'),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                children: <Widget>[
                  Text(
                    'Добро пожаловать,',
                    style: theme.textTheme.headlineMedium,
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: <Widget>[
                  Flexible(
                    child: Text(
                      'Открой для себя безграничный выбор и удобство.',
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
