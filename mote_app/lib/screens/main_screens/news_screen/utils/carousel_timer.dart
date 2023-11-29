import 'dart:async';

import 'package:flutter/material.dart';

Timer getTimer(int pageIndex, PageController pageController) {
  return Timer.periodic(const Duration(seconds: 3), (timer) {
    if (pageIndex == 3) {
      pageIndex = 0;
    }
    pageController.animateToPage(
      pageIndex,
      duration: const Duration(seconds: 2),
      curve: Curves.easeInOutCirc,
    );
    pageIndex++;
  });
}
