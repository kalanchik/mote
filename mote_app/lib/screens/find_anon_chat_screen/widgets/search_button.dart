import 'package:flutter/material.dart';

class AnonSearchButton extends StatelessWidget {
  const AnonSearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  size: 30,
                ),
                hintText: 'Тема чата ...',
              ),
            ),
          )
        ],
      ),
    );
  }
}
