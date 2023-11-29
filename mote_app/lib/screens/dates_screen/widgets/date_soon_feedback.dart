import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mote_app/models/test_users.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

class DateSoonFeedback extends StatelessWidget {
  final int dateId;
  final String dateStatus;
  final String dateKind;
  const DateSoonFeedback({
    super.key,
    required this.dateId,
    required this.dateStatus,
    required this.dateKind,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      width: 200,
      decoration: BoxDecoration(
        color: TSetColor.onBackgroundColor(context),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                dateKind == 'Вслепую'
                    ? 'Свидание ${dateKind.toLowerCase()}'
                    : 'Свидание',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                dateStatus,
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage(
                      TestUsers.dima.imgUrls[0],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Дима, 19',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Создатель',
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: dateStatus == 'Ждем встречи'
                      ? DecorationImage(
                          image: AssetImage(
                            TestUsers.dima.imgUrls[0],
                          ),
                        )
                      : null,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: dateStatus == 'Ждем встречи'
                    ? null
                    : const Center(
                        child: Icon(
                          Ionicons.person_circle_outline,
                          color: Colors.grey,
                          size: 30,
                        ),
                      ),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                dateStatus == 'Ожидает оценки'
                    ? 'Скрыт'
                    : dateStatus == 'Ждем встречи'
                        ? 'Дима, 19'
                        : 'Неизвестно',
                style: TextStyle(
                  fontSize: dateStatus == 'Ждем встречи' ? 18 : null,
                  color: dateStatus == 'Ждем встречи'
                      ? null
                      : Colors.white.withOpacity(0.4),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Container(
            width: 180,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 10),
              ),
              onPressed: () {},
              child: const Text(
                'О свидании',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
