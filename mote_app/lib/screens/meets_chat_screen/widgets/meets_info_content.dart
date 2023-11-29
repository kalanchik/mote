import 'package:flutter/material.dart';
import 'package:mote_app/models/user_model.dart';

class MeetsInfoContent extends StatelessWidget {
  final List<User> membersList;
  final List mediaList;
  final List historyList;
  final int contentIndex;
  const MeetsInfoContent({
    super.key,
    required this.membersList,
    required this.mediaList,
    required this.historyList,
    required this.contentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(25),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      width: MediaQuery.of(context).size.width * 0.9,
      child: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    if (contentIndex == 1) {
      return const Center(
        child: Text(
          'Медиа отсутствует',
        ),
      );
    }
    if (contentIndex == 2) {
      return const Center(
        child: Text('Пока ничего нет'),
      );
    }
    return Column(
      children: [
        ...List<Widget>.generate(
          membersList.length,
          (index) {
            final currentUser = membersList[index];
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              margin: const EdgeInsets.symmetric(vertical: 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: AssetImage(currentUser.imgUrls[0]),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Text(
                                  currentUser.name,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            index == 0 ? 'Онлайн' : 'Была в сети недавно',
                            style: TextStyle(
                              color: index == 0
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  index == 0
                      ? Text(
                          'Создатель',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
