import 'package:flutter/material.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

class DescButton extends StatelessWidget {
  final bool addDesc;
  final void Function() onTap;
  const DescButton({
    super.key,
    required this.addDesc,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 7,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          addDesc ? 'Убрать' : 'Добавить',
          style: TextStyle(
            color: TSetColor.buttonTextColor(context),
          ),
        ),
      ),
    );
  }
}
