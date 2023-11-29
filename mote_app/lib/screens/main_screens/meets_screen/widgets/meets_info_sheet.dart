import 'package:flutter/material.dart';
import 'package:mote_app/models/meets_models.dart';
import 'package:mote_app/screens/main_screens/meets_screen/widgets/meet_info_date.dart';
import 'package:mote_app/screens/main_screens/meets_screen/widgets/meet_info_desc.dart';
import 'package:mote_app/screens/main_screens/meets_screen/widgets/meet_info_header.dart';
import 'package:mote_app/screens/main_screens/meets_screen/widgets/meet_info_place.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

class MeetsInfoSheet extends StatelessWidget {
  final MeetsModels meet;
  const MeetsInfoSheet({super.key, required this.meet});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      maxChildSize: 0.7,
      minChildSize: 0.4,
      builder: (context, controleer) => ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: TSetColor.onBackgroundColor(context),
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(30),
            ),
          ),
          child: ListView(
            controller: controleer,
            children: [
              MeetInfoHeader(
                image: meet.imageFile!,
                meetName: meet.name,
                membersCount: meet.memCount,
                activeMembersCount: meet.membersList.length,
              ),
              const SizedBox(
                height: 10,
              ),
              MeetInfoDesc(desc: meet.desc),
              const SizedBox(
                height: 10,
              ),
              MeetInfoPlace(place: meet.place),
              const SizedBox(
                height: 15,
              ),
              MeetInfoDate(date: meet.date),
            ],
          ),
        ),
      ),
    );
  }
}
