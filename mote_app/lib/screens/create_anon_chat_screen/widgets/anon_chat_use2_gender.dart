import 'package:flutter/material.dart';
import 'package:mote_app/screens/create_anon_chat_screen/widgets/gender_button.dart';

class AnonChatUser2Gender extends StatelessWidget {
  final int genderIndex;
  final void Function(int newIndex) changeIndex;
  const AnonChatUser2Gender({
    super.key,
    required this.genderIndex,
    required this.changeIndex,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final genderList = <String>[
      'Парень',
      'Девушка',
      'Не важно',
    ];
    return Row(
      children: [
        Container(
          width: 150,
          child: Text(
            'Собеседник',
            style: theme.textTheme.headlineMedium,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        ChatGenderButton(
          onTap: () {
            var newIndex = genderIndex;
            if (genderIndex < genderList.length - 1) {
              newIndex += 1;
            }
            if (genderIndex >= genderList.length - 1) {
              newIndex = 0;
            }
            changeIndex(newIndex);
          },
          index: genderIndex,
          items: genderList,
        ),
      ],
    );
  }
}
