import 'package:flutter/material.dart';

class TopicField extends StatelessWidget {
  final TextEditingController controller;
  final int currentLenght;
  final VoidCallback onChanged;
  const TopicField({
    super.key,
    required this.controller,
    required this.currentLenght,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    maxLines: 1,
                    controller: controller,
                    onChanged: (value) {
                      onChanged();
                    },
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      hintText: 'Тема чата',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    children: [
                      const VerticalDivider(
                        indent: 5,
                        endIndent: 5,
                      ),
                      Text(
                        '$currentLenght/30',
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
