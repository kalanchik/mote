import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mote_app/models/user_model.dart';
import 'package:mote_app/screens/main_screens/friendship_screen/widgets/bottom_content.dart';
import 'package:mote_app/screens/main_screens/friendship_screen/widgets/custom_gradient.dart';

class UserCard extends StatefulWidget {
  const UserCard({
    super.key,
    required this.user,
    required this.openInfo,
    required this.isEnd,
    required this.currentPageIndex,
    required this.usersLenght,
  });

  final User user;
  final bool openInfo;
  final bool isEnd;
  final int currentPageIndex;
  final int usersLenght;

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard>
    with SingleTickerProviderStateMixin {
  late final PageController pageController;
  late final AnimationController controller;
  int userPhotoIndex = 0;

  @override
  void initState() {
    pageController = PageController(initialPage: 0, viewportFraction: 1);
    controller = AnimationController(vsync: this);
    controller.value = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.currentPageIndex == widget.usersLenght
        ? const Center(
            child: Text('Упс... Похоже,что ты посмотрел все анкеты'),
          )
        : GestureDetector(
            onTap: () {
              setState(() {
                if (userPhotoIndex == widget.user.imgUrls.length - 1) {
                  userPhotoIndex = 0;
                  controller.reset();
                  controller.forward();
                } else {
                  userPhotoIndex += 1;
                  controller.reset();
                  controller.forward();
                }
              });
            },
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(widget.user.imgUrls[userPhotoIndex]),
                      ),
                    ),
                  )
                      .animate(
                        controller: controller,
                        autoPlay: false,
                      )
                      .move(
                        duration: 1000.ms,
                        curve: Curves.fastEaseInToSlowEaseOut,
                      ),
                  const CustomGradient(),
                  Container(
                    margin: const EdgeInsets.only(top: 120),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List<Widget>.generate(
                          widget.user.imgUrls.length,
                          (index) {
                            return Container(
                              margin: const EdgeInsets.only(right: 5),
                              width: 60,
                              height: 3,
                              decoration: BoxDecoration(
                                color: index == userPhotoIndex
                                    ? Colors.white
                                    : Colors.white.withOpacity(0.2),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  widget.openInfo
                      ? const SizedBox.shrink()
                      : BottomContent(
                          name: widget.user.name,
                          age: widget.user.age,
                          city: widget.user.city,
                          interestList: widget.user.interestList,
                          desc: widget.user.desc,
                        ),
                ],
              ),
            ),
          );
  }
}
