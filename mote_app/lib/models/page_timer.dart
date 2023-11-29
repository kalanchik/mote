import 'dart:async';

import 'package:flutter/material.dart';

class PageTimer {
  Timer? timer;

  void stopTimer() {
    if (timer != null) {
      timer!.cancel();
    }
  }

  void initTimer(int pageIndex, PageController pageController) {
    if (pageIndex == 3) {
      pageIndex = 0;
    }
    pageController.animateToPage(
      pageIndex,
      duration: const Duration(seconds: 2),
      curve: Curves.easeInOutCirc,
    );
    pageIndex++;
  }
}
