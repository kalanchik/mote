import 'package:flutter/material.dart';

class ForgotPassHeader extends StatelessWidget {
  const ForgotPassHeader({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: <Widget>[
              Text(
                'Сбросить пароль',
                style: theme.textTheme.headlineLarge,
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  'Введите адрес электронной почты, связанный с вашей учетной записью, и мы отправим вам письмо в телеграм с инструкцией по сбросу вашего пароля.',
                  style: theme.textTheme.bodySmall,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
