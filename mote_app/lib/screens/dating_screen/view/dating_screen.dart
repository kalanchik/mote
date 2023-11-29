import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mote_app/models/user_model.dart';
import 'package:mote_app/models/users_page_controller.dart';
import 'package:mote_app/screens/dating_screen/widgets/action_row_buttons.dart';
import 'package:mote_app/screens/dating_screen/widgets/card_overlay.dart';
import 'package:mote_app/screens/dating_screen/widgets/user_info_sheet.dart';
import 'package:mote_app/screens/main_screens/friendship_screen/widgets/date_appbar.dart';
import 'package:mote_app/screens/main_screens/friendship_screen/widgets/user_card.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';
import 'package:swipable_stack/swipable_stack.dart';

@RoutePage()
class DatingScreen extends StatefulWidget {
  const DatingScreen({super.key});

  @override
  State<DatingScreen> createState() => _DatingScreenState();
}

class _DatingScreenState extends State<DatingScreen> {
  late final SwipableStackController swipeController;
  late final UsersPagesController profilePageController;
  void _listenerController() => setState(() {});
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black,
    ));
    super.initState();
    swipeController = SwipableStackController()
      ..addListener(() => _listenerController());
    profilePageController = UsersPagesController(
      usersListLenght: users.length,
      updateScreen: () => setState(() {}),
    );
  }

  @override
  void dispose() {
    super.dispose();
    swipeController
      ..removeListener(_listenerController)
      ..dispose();
  }

  final List<User> profileList = [...users];
  final List<User> usersLike = [];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Stack(
              children: [
                AnimatedContainer(
                  height: profilePageController.getInfoState()
                      ? size.height * 0.5
                      : size.height,
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.fastEaseInToSlowEaseOut,
                  child: SwipableStack(
                    itemCount: profileList.length + 1,
                    controller: swipeController,
                    detectableSwipeDirections: {
                      SwipeDirection.right,
                      SwipeDirection.left,
                    },
                    onSwipeCompleted: (index, direction) {
                      if (direction == SwipeDirection.right) {
                        setState(() {
                          usersLike.add(users[index]);
                        });
                      }
                      if (direction == SwipeDirection.left) {
                        // TODO: Delete users in usersList
                      }
                      print(profilePageController.currentPage());
                      setState(() {
                        profilePageController.nextPage();
                        profilePageController.closeInfo();
                      });
                    },
                    builder: (context, swipeProperty) {
                      var itemIndex = swipeProperty.index % profileList.length;
                      if (itemIndex == profileList.length) {
                        itemIndex = 0;
                      }
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Stack(
                          children: [
                            UserCard(
                              currentPageIndex: itemIndex,
                              usersLenght: profileList.length,
                              user: users[itemIndex],
                              openInfo: profilePageController.getInfoState(),
                              isEnd: profilePageController.isEnd,
                            ),
                            if (swipeProperty.stackIndex == 0 &&
                                swipeProperty.direction != null)
                              CardOverlay(
                                direction: swipeProperty.direction!,
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          profilePageController.changeInfoState();
                        });
                      },
                      child: AnimatedContainer(
                        margin: EdgeInsets.only(
                            bottom:
                                profilePageController.getInfoState() ? 0 : 15),
                        height: profilePageController.getInfoState()
                            ? size.height * 0.53
                            : 40,
                        duration: const Duration(milliseconds: 800),
                        decoration: BoxDecoration(
                          color: profilePageController.getInfoState()
                              ? TSetColor.backgroundColor(context)
                              : Colors.transparent,
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        curve: Curves.fastLinearToSlowEaseIn,
                        child: profilePageController.getInfoState()
                            ? ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                                child: UserInfoSheet(
                                  user: profileList[
                                      profilePageController.currentPage()],
                                ),
                              )
                            : Center(
                                child: Container(
                                  width: 150,
                                  child: const Icon(
                                    Icons.keyboard_arrow_up,
                                    size: 60,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            DateAppBar(
              controller: profilePageController,
            ),
            ActionRowsButtons(
              controller: swipeController,
              openInfo: profilePageController.getInfoState(),
            ),
          ],
        ),
      ),
    );
  }
}
