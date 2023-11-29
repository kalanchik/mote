import 'package:flutter/material.dart';
import 'package:mote_app/screens/profile/widgets/profile_info_card.dart';

class ProfileInfo extends StatelessWidget {
  final Map moteRating;
  const ProfileInfo({super.key, required this.moteRating});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ProfileInfoCard(
            icon: Icons.star,
            label: moteRating.isEmpty ? '0' : '100',
            iconColor: Colors.yellow[600],
          ),
          ProfileInfoCard(
            icon: Icons.remove_red_eye,
            label: moteRating.isEmpty ? '0' : '100',
            iconColor: Colors.blue,
          ),
          ProfileInfoCard(
            icon: Icons.favorite,
            label: moteRating.isEmpty ? '0' : '100',
            iconColor: Colors.red[400],
          ),
        ],
      ),
    );
  }
}
