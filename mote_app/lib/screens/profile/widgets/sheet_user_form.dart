import 'package:flutter/material.dart';
import 'package:mote_app/screens/profile/widgets/Question_generator.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

class SheetUserForm extends StatefulWidget {
  final void Function(Map<int, String>) loadData;
  const SheetUserForm({super.key, required this.loadData});

  @override
  State<SheetUserForm> createState() => _SheetUserFormState();
}

class _SheetUserFormState extends State<SheetUserForm>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  int pageNumber = 0;
  final List<List<String>> contentList = [
    [
      'Серьезные отношения',
      'Дружбу',
      'Просто общение',
      'Не важно',
    ],
    [
      'Свободен/Свободна',
      'В активном поиске',
      'В отношениях',
      'Пропустить',
    ],
    [
      'Нет работы',
      'Учусь',
      'Есть работа',
      'Пропустить',
    ],
    [
      'Не курю',
      'Курю',
      'Бросаю курить',
      'Пропустить',
    ],
    [
      'Не пью',
      'Пью за компанию',
      'Люблю выпить',
      'Пропустить',
    ],
  ];
  final List<String> questionText = [
    'Что ты ищешь?',
    'Какой у тебя текущий статус отношений?',
    'Какое у тебя материальное положение?',
    'Как ты относишься к курению?',
    'Как ты относишься к алкоголю?',
  ];

  final answers = <int, String>{
    0: '',
    1: '',
    2: '',
    3: '',
    4: '',
  };

  @override
  void initState() {
    controller = AnimationController(vsync: this);
    controller.value = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      builder: (context, scrollController) => Container(
        decoration: BoxDecoration(
          color: TSetColor.backgroundColor(context),
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(30),
          ),
        ),
        child: SingleChildScrollView(
          child: QuestionContent(
            controller: controller,
            number: pageNumber,
            questionText: questionText,
            textButtonList: contentList,
            onComplete: (String answer, int index) {
              setState(() {
                answers[index] = answer;
              });
            },
            nextPage: () {
              setState(() {
                if (pageNumber == 4) {
                  Navigator.of(context).pop();
                  widget.loadData(answers);
                } else {
                  pageNumber += 1;
                  controller.reset();
                  controller.forward();
                }
              });
            },
            backPage: () {
              setState(() {
                pageNumber -= 1;
                controller.reset();
                controller.forward();
              });
            },
          ),
        ),
      ),
    );
  }
}
