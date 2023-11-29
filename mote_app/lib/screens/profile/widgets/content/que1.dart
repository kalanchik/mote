import 'package:flutter/material.dart';
import 'package:mote_app/screens/profile/widgets/custom_text_button.dart';

class SheetContent1 extends StatelessWidget {
  const SheetContent1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 15,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 20,),
            const Text(
                'Вопрос 1 из 10',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            IconButton(onPressed: () {},
                icon: const Icon(
                  Icons.close,
                  color: Colors.grey,
                ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Что ты ищешь?',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 15,),
        CustomTextButton(
          labelText: 'Серьезные отношения',
          onPressed: () {},
          buttonColor: Theme.of(context).primaryColor,
        ),
        const SizedBox(height: 15,),
        CustomTextButton(
          labelText: 'Дружба',
          onPressed: () {},
          buttonColor: Theme.of(context).primaryColor,
        ),
        const SizedBox(height: 15,),
        CustomTextButton(
          labelText: 'Просто общение',
          onPressed: () {},
          buttonColor: Theme.of(context).primaryColor,
        ),
        const SizedBox(height: 15,),
        CustomTextButton(
          labelText: 'Не важно',
          onPressed: () {},
          buttonColor: Colors.grey,
        ),
      ],
    );
  }
}
