import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(height: 2, color: Colors.grey),
        ),
        SizedBox(
          width: 10,
        ),
        Text("Или"),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Divider(height: 2, color: Colors.grey),
        ),
      ],
    );
  }
}
