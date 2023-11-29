import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class UserInfoBloc extends StatelessWidget {
  const UserInfoBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Твой рейтинг',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '4.9',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Ionicons.star,
                    color: Colors.yellow,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
