import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mote_app/screens/phone_verify_screen/bloc/phone_verify_bloc.dart';
import 'package:mote_app/services/email_verify/email_verify.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';
import 'package:pinput/pinput.dart';

@RoutePage()
class PhoneVerifyScreen extends StatefulWidget {
  final int verCode;
  final String email;
  const PhoneVerifyScreen({
    super.key,
    required this.verCode,
    required this.email,
  });

  @override
  State<PhoneVerifyScreen> createState() => _PhoneVerifyScreenState();
}

class _PhoneVerifyScreenState extends State<PhoneVerifyScreen> {
  bool isButtonActive = false;

  int secondsRemaining = 120;

  final verContoller = TextEditingController();

  late Timer timer;

  final _bloc = PhoneVerifyBloc();

  @override
  void initState() {
    // Запуск таймера для повторной отправки
    sendButtonState();
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<PhoneVerifyBloc, PhoneVerifyState>(
        bloc: _bloc,
        builder: (context, state) {
          return SafeArea(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: size.height * 0.2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Код подтвержения',
                      style: theme.textTheme.headlineLarge,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Письмо с кодом было отправлено на вашу почту\n${widget.email}',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Pinput(
                  controller: verContoller,
                  length: 6,
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'Сообщение с кодом не приходит',
                    style: theme.textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: OutlinedButton(
                    onPressed: isButtonActive
                        ? () async {
                            final code = EmailVerification.generateCode();
                            await EmailVerification.sendMessage(
                              email: widget.email,
                              code: code,
                            );
                            secondsRemaining = 120;
                            sendButtonState();
                          }
                        : null,
                    child: isButtonActive
                        ? const Text('Письмо не приходит?')
                        : Text('Отправить повторно через $secondsRemaining '),
                  ),
                ),
                const SizedBox(
                  height: 150,
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: ElevatedButton(
                    child: _buildButton(state, context),
                    onPressed: () {
                      _verify(state);
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _verify(PhoneVerifyState state) {
    // Если сейчас отправляем письмо, то ничего не делаем
    if (state is PhoneVerifyStartState) return;

    // Запускаем отправку письма
    if (int.parse(verContoller.text.trim()) == widget.verCode) {
      _bloc.add(PhoneVerifyStart(context: context));
    }
  }

  void sendButtonState() {
    // Устанавливаем таймер с интервалом в 1 секунду
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        secondsRemaining--;
        if (secondsRemaining <= 0) {
          isButtonActive = true;
          timer.cancel(); // Останавливаем таймер после активации кнопки
        }
      });
    });
  }
}

Widget _buildButton(PhoneVerifyState state, BuildContext context) {
  if (state is PhoneVerifyStartState) {
    return LoadingAnimationWidget.twoRotatingArc(
      color: TSetColor.buttonTextColor(context),
      size: 17,
    );
  }
  return const Text('Подтвердить');
}
