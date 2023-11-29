import 'package:flutter/material.dart';
import 'package:mote_app/screens/forgot_pass_screen/widgets/forgot_pass_header.dart';
import 'package:mote_app/utils/validators/email_validate.dart';

class EmailInput extends StatefulWidget {
  final TextEditingController controller;
  final void Function(int index) changePage;
  const EmailInput({
    super.key,
    required this.controller,
    required this.changePage,
  });

  @override
  State<EmailInput> createState() => _EmailInputState();
}

class _EmailInputState extends State<EmailInput> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 15,
        ),
        ForgotPassHeader(theme: theme),
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Почта',
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      controller: widget.controller,
                      validator: EmailValidator.validate,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    child: ElevatedButton(
                      onPressed: () {
                        widget.changePage(1);
                      },
                      child: const Text('Написать в телеграм'),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
