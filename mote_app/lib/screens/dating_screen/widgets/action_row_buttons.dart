import 'package:flutter/material.dart';
import 'package:mote_app/screens/main_screens/friendship_screen/widgets/bottom_action_button.dart';
import 'package:swipable_stack/swipable_stack.dart';

class ActionRowsButtons extends StatelessWidget {
  const ActionRowsButtons({
    super.key,
    required this.controller,
    required this.openInfo,
  });

  final SwipableStackController controller;
  final bool openInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BottomActionButton(
                  openInfo: openInfo,
                  direction: 'left',
                  iconData: Icons.close,
                  onTap: () {
                    controller.next(swipeDirection: SwipeDirection.left);
                  },
                  backColor: Colors.grey.withOpacity(0.2),
                  textColor: Colors.white,
                ),
                BottomActionButton(
                  openInfo: openInfo,
                  direction: 'right',
                  iconData: Icons.favorite,
                  onTap: () {
                    controller.next(swipeDirection: SwipeDirection.right);
                  },
                  backColor: Colors.white,
                  textColor: Colors.black,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
