import 'package:flutter/material.dart';
import 'package:mote_app/models/meets_models.dart';
import 'package:mote_app/screens/main_screens/meets_screen/widgets/city_selector.dart';
import 'package:mote_app/screens/main_screens/meets_screen/widgets/meets_card.dart';
import 'package:mote_app/screens/main_screens/meets_screen/widgets/meets_info_sheet.dart';

class FindMeetsContent extends StatefulWidget {
  final List<MeetsModels> findMeetsList;
  const FindMeetsContent({super.key, required this.findMeetsList});

  @override
  State<FindMeetsContent> createState() => _FindMeetsContentState();
}

class _FindMeetsContentState extends State<FindMeetsContent> {
  final List<Widget> meetsList = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CitySelector(),
        const SizedBox(
          height: 15,
        ),
        ..._buildTestMeet(context, widget.findMeetsList),
      ],
    );
  }

  List<Widget> _buildTestMeet(BuildContext context, List<MeetsModels> list) {
    if (widget.findMeetsList.isEmpty) {
      return [
        const Text(
          'В твоем городе пока нет встреч :(',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ];
    }
    final list = List<Widget>.generate(
      widget.findMeetsList.length,
      (index) => Column(
        children: [
          MeetsCard(
            meet: widget.findMeetsList[index],
            onTap: () {
              showModalBottomSheet(
                context: context,
                showDragHandle: false,
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                builder: (context) => MeetsInfoSheet(
                  meet: widget.findMeetsList[index],
                ),
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
          ),
        ],
      ),
    );
    for (var i = 0; i < 5; i++) {
      list.add(list[0]);
    }
    return list;
  }

  int _countList() {
    return 12;
  }
}
