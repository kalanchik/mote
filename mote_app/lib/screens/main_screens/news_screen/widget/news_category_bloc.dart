import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mote_app/router/router.dart';
import 'package:mote_app/screens/main_screens/news_screen/widget/news_category_card.dart';

class NewsCategoryBloc extends StatelessWidget {
  const NewsCategoryBloc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Wrap(
        alignment: WrapAlignment.spaceAround,
        spacing: 5.0,
        runSpacing: 10.0,
        children: [
          NewCategoryCard(
            categoryText: 'Знакомства',
            icon: Icons.favorite,
            iconColor: Colors.red[400],
            onTap: () {
              AutoRouter.of(context).push(const DatingRoute());
            },
          ),
          NewCategoryCard(
            categoryText: 'Обновления',
            icon: Icons.browser_updated,
            iconColor: Colors.black,
            onTap: () {},
          ),
          NewCategoryCard(
            categoryText: 'Сообщения',
            icon: Icons.message,
            iconColor: Colors.blue[200],
            onTap: () {},
          ),
          NewCategoryCard(
            categoryText: 'Встречи',
            icon: Icons.people,
            iconColor: Colors.amber,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
