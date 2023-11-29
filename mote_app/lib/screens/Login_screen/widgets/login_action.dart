import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mote_app/router/router.dart';

class LoginAction extends StatelessWidget {
  final VoidCallback onLogin;
  const LoginAction({
    super.key,
    required this.onLogin,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  child: ElevatedButton(
                    onPressed: onLogin,
                    child: const Text('Войти'),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(),
                    onPressed: () {
                      AutoRouter.of(context).push(const RegisterRoute());
                    },
                    child: const Text('Создать аккаунт'),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
