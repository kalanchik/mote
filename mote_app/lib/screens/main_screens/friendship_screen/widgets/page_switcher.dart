import 'package:flutter/material.dart';

class PageSwitcher extends StatelessWidget {
  const PageSwitcher({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              const Text(
                'Анкеты',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                height: 4,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                ),
              )
            ],
          ),
          Column(
            children: [
              const Text(
                'Мои лайки',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                height: 6,
                width: 50,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
