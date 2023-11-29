import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  const Responsive({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 725;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 725 &&
      MediaQuery.of(context).size.width < 1083;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1083;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1083) {
          return desktop;
        }
        if (constraints.maxWidth >= 725) {
          return tablet;
        }
        return mobile;
      },
    );
  }
}
