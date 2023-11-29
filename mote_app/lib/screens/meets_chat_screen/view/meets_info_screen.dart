import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mote_app/models/meets_models.dart';
import 'package:mote_app/screens/meets_chat_screen/widgets/meets_info_about_meet.dart';
import 'package:mote_app/screens/meets_chat_screen/widgets/meets_info_content.dart';
import 'package:mote_app/screens/meets_chat_screen/widgets/meets_info_header.dart';
import 'package:mote_app/screens/meets_chat_screen/widgets/meets_info_selector.dart';

@RoutePage()
class MeetsChatInfoScreen extends StatefulWidget {
  final MeetsModels meet;
  const MeetsChatInfoScreen({super.key, required this.meet});

  @override
  State<MeetsChatInfoScreen> createState() => _MeetsChatInfoScreenState();
}

class _MeetsChatInfoScreenState extends State<MeetsChatInfoScreen>
    with TickerProviderStateMixin {
  final scrollController = ScrollController();
  late final AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  int contentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              print(scrollController.offset);
            },
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: ListView(
        controller: scrollController,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(0),
        children: [
          MeetsInfoHeader(
            meetImage: widget.meet.imageFile!,
            membersCountl: widget.meet.membersList.length,
            meetName: widget.meet.name,
          ),
          const SizedBox(
            height: 10,
          ),
          MeetsInfoAboutMeet(
            meetDesc: widget.meet.desc,
            meetPlace: widget.meet.place,
            meetDate: widget.meet.date,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                MeetsInfoSelector(
                  changeContent: _changeContent,
                ),
                MeetsInfoContent(
                  membersList: widget.meet.membersList,
                  mediaList: [],
                  historyList: [],
                  contentIndex: contentIndex,
                )
                    .animate(
                      controller: controller,
                      autoPlay: true,
                    )
                    .slide(
                      begin: const Offset(-5, 0),
                      duration: 300.ms,
                      curve: Curves.fastEaseInToSlowEaseOut,
                    )
                    .fade(
                      duration: 1000.ms,
                      curve: Curves.fastEaseInToSlowEaseOut,
                    ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _changeContent(int index) {
    setState(() {
      contentIndex = index;
    });
    controller.reset();
    controller.forward();
  }
}
