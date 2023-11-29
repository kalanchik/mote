import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mote_app/models/register_user.dart';
import 'package:preload_page_view/preload_page_view.dart';

class UserPhotoSlider extends StatefulWidget {
  const UserPhotoSlider({super.key});

  @override
  State<UserPhotoSlider> createState() => _UserPhotoSliderState();
}

class _UserPhotoSliderState extends State<UserPhotoSlider> {
  late final PreloadPageController pageController;
  late final PageController indicatorController;
  @override
  void initState() {
    pageController = PreloadPageController(viewportFraction: 1);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userImages = GetIt.I<RegisterUser>().getUserImageTest();
    return Stack(
      children: [
        PreloadPageView.builder(
          pageSnapping: true,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: userImages.length,
          preloadPagesCount: 6,
          onPageChanged: (value) {},
          controller: pageController,
          itemBuilder: (context, index) => Container(
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(0)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: userImages[index],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
