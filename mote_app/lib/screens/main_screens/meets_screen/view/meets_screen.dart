import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mote_app/models/meets_models.dart';
import 'package:mote_app/screens/main_screens/meets_screen/bloc/meets_bloc.dart';
import 'package:mote_app/screens/main_screens/meets_screen/widgets/create_meets_content.dart';
import 'package:mote_app/screens/main_screens/meets_screen/widgets/find_meets_content.dart';
import 'package:mote_app/screens/main_screens/meets_screen/widgets/loading_content.dart';
import 'package:mote_app/screens/main_screens/meets_screen/widgets/meets_header.dart';
import 'package:mote_app/screens/main_screens/meets_screen/widgets/my_meets_content.dart';
import 'package:mote_app/screens/main_screens/meets_screen/widgets/upload_photo_content.dart';
import 'package:mote_app/screens/main_screens/news_screen/widget/news_drawer.dart';
import 'package:mote_app/widgets/custom_elevated_buttom.dart';

@RoutePage()
class MeetsScreen extends StatefulWidget {
  const MeetsScreen({super.key});

  @override
  State<MeetsScreen> createState() => _MeetsScreenState();
}

class _MeetsScreenState extends State<MeetsScreen>
    with SingleTickerProviderStateMixin {
  final _bloc = MeetsBloc();

  int pageIndex = 0;

  @override
  void initState() {
    _bloc.add(MeetsLoadingMeets());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NewsDrawer(drawerIndex: 5, changeIndex: (index) {}),
      appBar: AppBar(),
      body: BlocBuilder<MeetsBloc, MeetsState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is MeetsLoadingMeetsState) {
            return const MeetsLoadingContent(labelText: 'Загружаем встречи');
          }
          if (state is MeetsUploadPhoto) {
            return MeetsUploadPhotoContent(
              copmplete: (MeetsModels meet) {
                _bloc.add(MeetsSaveMeetsEvent(meet: meet));
              },
              meet: state.meet,
            );
          }
          if (state is MeetsCreatingMeet) {
            return const MeetsLoadingContent(labelText: 'Создаем встречу');
          }
          if (state is MeetsCreatedMeet) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Встреча успешно создана!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'Когда кто-то присоединится, мы вам сообщим',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomElevatedButton(
                  labelText: 'К встречам',
                  onTap: () {
                    setState(() {
                      pageIndex = 0;
                      _bloc.add(MeetsLoadingMeets());
                    });
                  },
                ),
              ],
            ).animate().scale(
                  delay: 300.ms,
                  duration: 600.ms,
                  curve: Curves.fastEaseInToSlowEaseOut,
                );
          }
          if (state is MeetsLoadedMeetsState) {
            return ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                MeetsHeader(
                  pageIndex: pageIndex,
                  changeIndex: (int index) {
                    if (pageIndex == index) {
                      return;
                    }
                    setState(() {
                      pageIndex = index;
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  height: 10,
                ),
                _buildContent(
                  index: pageIndex,
                  myMeetsList: state.myMeetsList,
                  findMeetsList: state.findMeetsList,
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _buildContent({
    required int? index,
    required List<MeetsModels> myMeetsList,
    required List<MeetsModels> findMeetsList,
  }) {
    if (index == 0) {
      return MyMeetsContent(
        myMeets: myMeetsList,
      );
    }
    if (index == 1) {
      return FindMeetsContent(
        findMeetsList: findMeetsList,
      );
    }
    if (index == 2) {
      return CreateMeetsContent(
        createMeet: (MeetsModels meet) {
          _bloc.add(MeetsCreateMeetEvent(meet: meet));
        },
      );
    }
    return Container();
  }
}
