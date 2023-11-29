import 'package:flutter/material.dart';
import 'package:mote_app/models/user_model.dart';
import 'package:mote_app/screens/main_screens/friendship_screen/widgets/about_me_bloc.dart';
import 'package:mote_app/screens/main_screens/friendship_screen/widgets/interest_bloc.dart';
import 'package:mote_app/screens/main_screens/friendship_screen/widgets/user_info_header.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

class UserInfoSheet extends StatelessWidget {
  const UserInfoSheet({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: TSetColor.backgroundColor(context),
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: ListView(
        children: [
          const SizedBox(
            height: 15,
          ),
          UserInfoHeader(
            name: user.name,
            age: user.age,
            work: user.work,
            education: user.education,
            city: user.city,
          ),
          AboutMeBloc(
            desc: user.desc,
            sign: user.sign,
          ),
          InterestBloc(interests: user.interestList),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
