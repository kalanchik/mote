import 'package:flutter/material.dart';
import 'package:mote_web/HomeScreen/view/home_screen.dart';

void main() {
  runApp(const MoteWeb());
}

class MoteWeb extends StatelessWidget {
  const MoteWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
