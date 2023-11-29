import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PinCodeInput extends StatefulWidget {
  final void Function(int index) changeIndex;
  const PinCodeInput({super.key, required this.changeIndex});

  @override
  State<PinCodeInput> createState() => _PinCodeInputState();
}

class _PinCodeInputState extends State<PinCodeInput> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Проверь свой телеграм',
                style: theme.textTheme.headlineMedium,
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: Text(
                  'Мы отправили вам код для восстановления через нашего бота',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodySmall,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Pinput(
            length: 5,
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    widget.changeIndex(2);
                  },
                  child: const Text('Подтвердить'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
