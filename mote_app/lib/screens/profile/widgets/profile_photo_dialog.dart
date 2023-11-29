import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ProfilePhotoDialog extends StatefulWidget {
  final int index;
  final List<String> imageList;
  const ProfilePhotoDialog({
    super.key,
    required this.index,
    required this.imageList,
  });

  @override
  State<ProfilePhotoDialog> createState() => _ProfilePhotoDialogState();
}

class _ProfilePhotoDialogState extends State<ProfilePhotoDialog>
    with SingleTickerProviderStateMixin {
  late int photoIndex;
  bool nextPhoto = false;
  late final AnimationController controller;
  @override
  void initState() {
    controller = AnimationController(vsync: this);
    photoIndex = widget.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            photoIndex == 0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.fastEaseInToSlowEaseOut,
                        width: nextPhoto ? 0 : 200,
                        height: nextPhoto ? 0 : 50,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            'Основная',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ).animate(controller: controller).scale(
                      curve: Curves.fastEaseInToSlowEaseOut,
                      duration: 600.ms,
                    )
                : const SizedBox.shrink(),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: backPhoto,
                  child: const Icon(
                    Icons.keyboard_arrow_left,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
                Container(
                  height: 400,
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(widget.imageList[photoIndex]),
                    ),
                  ),
                )
                    .animate(
                      controller: controller,
                    )
                    .fade(
                      curve: Curves.fastEaseInToSlowEaseOut,
                      duration: 600.ms,
                    )
                    .slide(
                      curve: Curves.fastEaseInToSlowEaseOut,
                      duration: 600.ms,
                      begin: const Offset(-1, 0),
                    ),
                GestureDetector(
                  onTap: newxtPhoto,
                  child: const Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.swap_horiz),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Поменять',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.delete),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Удалить',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void newxtPhoto() async {
    final photoCount = widget.imageList.length - 1;
    if (photoIndex < photoCount) {
      setState(() {
        photoIndex += 1;
        controller.reset();
        controller.forward();
      });
      return;
    }
    if (photoIndex == photoCount) {
      setState(() {
        photoIndex = 0;
        controller.reset();
        controller.forward();
      });
    }
  }

  void backPhoto() async {
    final photoCount = widget.imageList.length - 1;
    if (photoIndex > 0) {
      setState(() {
        photoIndex -= 1;
        controller.reset();
        controller.forward();
      });
      return;
    }
    if (photoIndex == 0) {
      setState(() {
        photoIndex = photoCount;
        controller.reset();
        controller.forward();
      });
    }
  }
}
