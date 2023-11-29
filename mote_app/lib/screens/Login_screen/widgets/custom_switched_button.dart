import 'package:flutter/material.dart';

class CustomSwitchedButton extends StatefulWidget {
  final void Function(int index) updateIndex;
  final int pageIndex;
  const CustomSwitchedButton(
      {super.key, required this.updateIndex, required this.pageIndex});

  @override
  State<CustomSwitchedButton> createState() => _CustomSwitchedButtonState();
}

class _CustomSwitchedButtonState extends State<CustomSwitchedButton> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(20),
          ),
          height: 50,
          width: size.width * 0.9,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () => widget.updateIndex(0),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  decoration: BoxDecoration(
                    color: isSelected(0, widget.pageIndex)
                        ? Colors.white
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Text(
                    'Войти',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => widget.updateIndex(1),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  decoration: BoxDecoration(
                    color: isSelected(1, widget.pageIndex)
                        ? Colors.white
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Text(
                    'Регистрация',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

bool isSelected(int itemIndex, int index) {
  return itemIndex == index;
}
