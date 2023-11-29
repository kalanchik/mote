import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mote_app/router/router.dart';
import 'package:mote_app/utils/validators/email_validate.dart';
import 'package:mote_app/utils/validators/password_validator.dart';

class LoginBody extends StatelessWidget {
  final bool isRememberMe;
  final TextEditingController emailController;
  final TextEditingController passController;
  final void Function(bool? value) onChanged;
  const LoginBody({
    super.key,
    required this.theme,
    required this.isRememberMe,
    required this.emailController,
    required this.passController,
    required this.onChanged,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  controller: emailController,
                  validator: EmailValidator.validate,
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                    labelText: 'Почта',
                    prefixIcon: Icon(
                      Ionicons.mail_outline,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  controller: passController,
                  validator: PasswordValidator.validate,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                    labelText: 'Пароль',
                    prefixIcon: Icon(
                      Ionicons.key_sharp,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Checkbox(
                    value: isRememberMe,
                    onChanged: onChanged,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  const Text('Запомнить меня'),
                ],
              ),
              TextButton(
                onPressed: () {
                  if (emailController.text.isEmpty) {
                    AutoRouter.of(context).push(
                      ForgotPassRoute(email: ''),
                    );
                  } else {
                    AutoRouter.of(context).push(
                      ForgotPassRoute(email: emailController.text.trim()),
                    );
                  }
                },
                child: const Text('Забыл пароль?'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
