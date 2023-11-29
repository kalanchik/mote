import 'package:flutter/material.dart';

class MyLikesBloc extends StatelessWidget {
  final List likeList;
  const MyLikesBloc({super.key, required this.likeList});

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
                'Лайкнули твою анкету',
                style: theme.textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        if (likeList.isEmpty)
          Container(
            height: 50,
            child: Center(
              child: Text(
                'Твою анкету еще никто не лайкнул 😢',
                style: theme.textTheme.headlineSmall!.copyWith(
                  color: Colors.grey,
                ),
              ),
            ),
          )
        else
          SizedBox(
            height: 60,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: likeList.length,
              itemBuilder: (context, index) {
                final user = likeList[index];
                return Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(user.imgUrls[0]),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
