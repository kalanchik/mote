import 'package:flutter/material.dart';

class DescField extends StatelessWidget {
  final TextEditingController controller;
  const DescField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 150,
      ),
      child: TextFormField(
        controller: controller,
        maxLines: null,
        decoration: const InputDecoration(
          hintText: 'Напиши описание для чата ...',
        ),
      ),
    );
  }
}
