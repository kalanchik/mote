import 'package:flutter/material.dart';

class MyPhotoAppBar extends StatelessWidget {
  const MyPhotoAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            color: Colors.black45,
            borderRadius: BorderRadius.circular(20),
          ),
          height: 6,
          width: 100,
        )
      ],
    );
  }
}
