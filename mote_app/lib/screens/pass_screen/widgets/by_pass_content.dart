import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mote_app/screens/pass_screen/widgets/pass_card.dart';

class ByPassContent extends StatelessWidget {
  const ByPassContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: AnimateList(
          interval: 50.ms,
          effects: [
            FadeEffect(
              duration: 600.ms,
              curve: Curves.fastEaseInToSlowEaseOut,
            ),
            SlideEffect(
              duration: 600.ms,
              curve: Curves.fastEaseInToSlowEaseOut,
              begin: const Offset(-5, 0),
            ),
          ],
          children: [
            const SizedBox(
              height: 20,
            ),
            PassCard(
              termText: 'На год',
              price: 1500,
              onTap: () {},
            ),
            const SizedBox(
              height: 15,
            ),
            PassCard(
              termText: 'На месяц',
              price: 150,
              onTap: () {},
            ),
            const SizedBox(
              height: 15,
            ),
            PassCard(
              termText: 'На неделю',
              price: 75,
              onTap: () {},
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
