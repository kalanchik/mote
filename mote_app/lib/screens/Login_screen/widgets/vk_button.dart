import 'package:flutter/material.dart';
import 'package:mote_app/models/constants.dart';

class VkButton extends StatelessWidget {
  const VkButton({
    super.key,
    required this.size,
    required this.theme,
  });

  final Size size;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: size.width * 0.8,
        height: 50,
        decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Container(
                decoration: const BoxDecoration(),
                height: 30,
                child: Image.asset('${Constants.imagePath}vk_logo.png'),
              ),
              const SizedBox(
                width: 15,
              ),
              const Text(
                'Войти с помощью VK ID',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
