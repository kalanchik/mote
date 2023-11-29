import 'package:flutter/material.dart';
import 'package:mote_app/screens/profile/widgets/profile_appbar_content.dart';
import 'package:mote_app/screens/profile/widgets/profile_info.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

class ProfileAppBar extends StatelessWidget {
  final bool isHidePhoto;
  final String mainPhoto;
  final String name;
  final int age;
  final Map moteRating;
  const ProfileAppBar(
      {super.key,
      required this.isHidePhoto,
      required this.mainPhoto,
      required this.name,
      required this.age,
      required this.moteRating});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      iconTheme: IconThemeData(
        color: isHidePhoto ? TSetColor.textColor(context) : Colors.white,
      ),
      backgroundColor: TSetColor.backgroundColor(context),
      expandedHeight: 300,
      elevation: 0,
      pinned: true,
      stretch: true,
      centerTitle: false,
      title: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastEaseInToSlowEaseOut,
        height: isHidePhoto ? 50 : 0,
        child: ProfileAppBarContent(
          imgUrl: mainPhoto,
          name: name,
          age: age,
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: [
          StretchMode.zoomBackground,
        ],
        background: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    mainPhoto,
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: Row(
                    children: [
                      Text(
                        '$name, $age',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ProfileInfo(
                        moteRating: moteRating,
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
