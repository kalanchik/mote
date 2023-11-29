import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class MeetsSearch extends StatelessWidget {
  const MeetsSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Поиск встречи',
                prefixIcon: Icon(Ionicons.search),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
