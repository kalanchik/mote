import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mote_app/screens/profile/widgets/custom_text_button.dart';

class QuestionContent extends StatelessWidget {
  final int number;
  final List<String> questionText;
  final List<List<String>> textButtonList;
  final void Function(String answer, int index) onComplete;
  final void Function() nextPage;
  final void Function() backPage;
  final AnimationController controller;
  const QuestionContent({
    super.key,
    required this.number,
    required this.questionText,
    required this.textButtonList,
    required this.onComplete,
    required this.nextPage,
    required this.backPage,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final questionNumber = number + 1;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            number == 0
                ? const SizedBox(
                    width: 40,
                  )
                : IconButton(
                    onPressed: backPage,
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.grey,
                      size: 30,
                    ),
                  ).animate().scale(
                      duration: 600.ms,
                      curve: Curves.fastEaseInToSlowEaseOut,
                    ),
            Row(
              children: [
                const Text(
                  'Вопрос',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  '$questionNumber',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                )
                    .animate(
                      controller: controller,
                      autoPlay: false,
                    )
                    .scale(
                      curve: Curves.fastEaseInToSlowEaseOut,
                      duration: 600.ms,
                    ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  'из 5',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.close,
                color: Colors.grey,
                size: 30,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          children: [
            Text(
              questionText[number],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ...List<Widget>.generate(
              textButtonList[number].length,
              (index) {
                final lastIndex = textButtonList[number].length - 1;
                return CustomTextButton(
                  labelText: textButtonList[number][index],
                  onPressed: () {
                    onComplete(textButtonList[number][index], number);
                    nextPage();
                  },
                  buttonColor: index == lastIndex
                      ? Colors.grey
                      : Theme.of(context).primaryColor,
                );
              },
            )
          ],
        )
            .animate(
              controller: controller,
              autoPlay: false,
            )
            .scale(
              duration: 600.ms,
              curve: Curves.fastEaseInToSlowEaseOut,
            )
      ],
    );
  }
}
