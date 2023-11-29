import 'package:flutter/material.dart';
import 'package:mote_app/screens/create_anon_chat_screen/widgets/gender_button.dart';

class AnonChatChoiceMyGender extends StatelessWidget {
  final int myGenderIndex;
  final void Function(int newIndex) changeIndex;
  const AnonChatChoiceMyGender({
    super.key,
    required this.myGenderIndex,
    required this.changeIndex,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final myGenderList = <String>[
      'Парень',
      'Скрыт',
    ];
    return Row(
      children: [
        Container(
          width: 150,
          child: Text(
            'Мой пол',
            style: theme.textTheme.headlineMedium,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        ChatGenderButton(
          onTap: () {
            var newIndex = myGenderIndex;
            if (myGenderIndex < myGenderList.length - 1) {
              newIndex += 1;
              changeIndex(newIndex);
            }
            if (myGenderIndex >= myGenderList.length - 1) {
              newIndex = 0;
              changeIndex(newIndex);
            }
          },
          index: myGenderIndex,
          items: myGenderList,
        ),
      ],
    );
  }
}
