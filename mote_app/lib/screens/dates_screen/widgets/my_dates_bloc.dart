import 'package:flutter/material.dart';
import 'package:mote_app/screens/dates_screen/widgets/date_soon_feedback.dart';

class MyDates extends StatelessWidget {
  final List myDates;
  const MyDates({super.key, required this.myDates});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text(
                'Мои свидания',
                style: theme.textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        myDates.isEmpty
            ? Container(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'У тебя еще не было свиданий 😕',
                          style: theme.textTheme.headlineSmall!.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            : SizedBox(
                height: 250,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    late String status;
                    late String dateKind;
                    status = 'Поиск партнера';
                    dateKind = 'Обычное';
                    if (index % 2 == 0) {
                      status = 'Ждем встречи';
                    }
                    if (index % 5 == 0) {
                      status = 'Закрыто';
                    }
                    if (index % 3 == 0) {
                      status = 'Ожидает оценки';
                      dateKind = 'Вслепую';
                    }
                    return DateSoonFeedback(
                      dateKind: dateKind,
                      dateId: index + 1,
                      dateStatus: status,
                    );
                  },
                ),
              ),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
