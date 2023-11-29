import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BottomContent extends StatelessWidget {
  const BottomContent({
    super.key,
    required this.name,
    required this.age,
    required this.city,
    required this.interestList,
    required this.desc,
  });

  final String name;
  final int age;
  final String city;
  final List<String> interestList;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '$name, ',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.95),
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.none,
                ),
              ),
              Text(
                '$age',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.95),
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.none,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Icon(
                Iconsax.location,
                color: Colors.white,
                size: 25,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                city,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Wrap(
            spacing: 5.0,
            runSpacing: 7.5,
            children: [
              ...List<Widget>.generate(
                3,
                (index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 5),
                    padding: const EdgeInsets.only(
                      left: 6,
                      top: 9,
                      bottom: 9,
                      right: 15,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: index == 0
                          ? Theme.of(context).primaryColor
                          : Colors.white.withOpacity(0.2),
                    ),
                    child: Text(
                      interestList[index],
                      style: TextStyle(
                        color: index == 0 ? Colors.white : Colors.white,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none,
                        fontSize: 15,
                      ),
                    ),
                  );
                },
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Flexible(
            child: Container(
              height: 20,
              child: Text(
                desc,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.95),
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
