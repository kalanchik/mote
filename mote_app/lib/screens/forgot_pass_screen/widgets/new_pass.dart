import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mote_app/router/router.dart';
import 'package:mote_app/utils/quickalert/quickalert.dart';
import 'package:mote_app/utils/validators/confrim_password.dart';
import 'package:mote_app/utils/validators/password_validator.dart';
import 'package:quickalert/quickalert.dart';

class NewPass extends StatefulWidget {
  const NewPass({super.key});

  @override
  State<NewPass> createState() => _NewPassState();
}

class _NewPassState extends State<NewPass> {
  final pass1 = TextEditingController();
  final pass2 = TextEditingController();
  bool isHidePass1 = true;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Row(
            children: <Widget>[
              Text(
                'Новый пароль',
                style: theme.textTheme.headlineLarge,
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: <Widget>[
              Flexible(
                child: Text(
                  'Ваш новый пароль должен отличаться от ранее использованных паролей.',
                  style: theme.textTheme.bodySmall,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Новый пароль',
                  style: theme.textTheme.bodySmall,
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      pass1.text = generatePassword();
                      isHidePass1 = false;
                    });
                  },
                  child: const Text('Сгенерировать пароль'),
                )
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  controller: pass1,
                  obscureText: isHidePass1,
                  decoration: const InputDecoration(),
                  validator: PasswordValidator.validate,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  textInputAction: TextInputAction.next,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              children: <Widget>[
                Text(
                  'Подтверждение пароля',
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  controller: pass2,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  textInputAction: TextInputAction.done,
                  validator: (String? pass) {
                    return PasswordConfirmationValidator.validate(
                      pass1.text.trim(),
                      pass ?? '',
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    if (pass1.text == pass2.text) {
                      TQuickAlert.showQuickAlert(
                        context: context,
                        type: QuickAlertType.success,
                        title: 'Поздравляем',
                        text: 'Ваш пароль изменен',
                        confrimButton: 'На главную',
                        onTap: () {
                          AutoRouter.of(context).popAndPushAll([
                            const LoginRoute(),
                          ]);
                        },
                      );
                    }
                  },
                  child: const Text('Изменить пароль'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
