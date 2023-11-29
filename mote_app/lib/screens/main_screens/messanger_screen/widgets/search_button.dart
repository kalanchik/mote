import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            decoration: const InputDecoration(
              hintText: 'Номер чата',
              prefixIcon: Icon(Ionicons.search),
            ),
          ),
        )
      ],
    );
  }
}
