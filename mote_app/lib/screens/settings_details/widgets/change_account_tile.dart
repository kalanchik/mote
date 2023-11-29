import 'package:flutter/material.dart';

class ChangeAccountTile extends StatelessWidget {
  final String paramName;
  final String hintText;
  final IconData icon;
  const ChangeAccountTile(
      {super.key,
      required this.paramName,
      required this.hintText,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 130,
          child: Row(
            children: [
              Icon(
                icon,
                size: 25,
                color: Colors.grey,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                paramName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: TextFormField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: hintText,
            ),
          ),
        ),
      ],
    );
  }
}
