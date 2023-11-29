import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mote_app/screens/main_screens/news_screen/widget/news_drawer.dart';
import 'package:mote_app/screens/profile/bloc/profile_bloc.dart';
import 'package:mote_app/screens/profile/widgets/Profile_app_bar.dart';
import 'package:mote_app/screens/profile/widgets/profile_about_me.dart';
import 'package:mote_app/screens/profile/widgets/profile_indicator.dart';
import 'package:mote_app/screens/profile/widgets/profile_my_photo.dart';
import 'package:mote_app/screens/profile/widgets/profile_photo_tip.dart';
import 'package:mote_app/screens/profile/widgets/profile_survey_tip.dart';
import 'package:mote_app/screens/profile/widgets/sheet/profile_test_bloc.dart';
import 'package:mote_app/screens/reg_profile_screen/widgets/my_interest.dart';
import 'package:mote_app/services/percent_counter/profile_percent_counter.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final ScrollController controller;
  late final TextEditingController descController;

  bool isHidePhoto = false;

  late final ProfileBloc _bloc;

  @override
  void initState() {
    _bloc = ProfileBloc();
    _bloc.add(ProfileLoadingEvent());
    controller = ScrollController();
    descController = TextEditingController();
    controller.addListener(() => _photoListener());
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: TSetColor.backgroundColor(context),
    ));
    final theme = Theme.of(context);
    return Scaffold(
      drawer: NewsDrawer(drawerIndex: 1, changeIndex: (index) {}),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is ProfileLoadedState) {
            return CustomScrollView(
              controller: controller,
              slivers: [
                ProfileAppBar(
                  isHidePhoto: isHidePhoto,
                  name: state.profileInfo.name,
                  age: state.profileInfo.age,
                  mainPhoto: state.profileInfo.mainPhoto,
                  moteRating: state.profileInfo.moteRating,
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: AnimateList(
                      children: [
                        ProfileIndicator(
                          progress: ProfilePercentCounter.count(
                              profile: state.profileInfo.toJson()),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ProfileMyPhoto(
                          photos: state.profileInfo.photos,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const ProfilePhotoTip(),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: <Widget>[
                                  Text(
                                    'Интересы',
                                    style: theme.textTheme.headlineMedium,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              MyInterest(items: state.profileInfo.interests),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ProfileAboutMe(
                          controller: descController,
                          desc: state.profileInfo.desc,
                          work: state.profileInfo.work,
                          education: state.profileInfo.education,
                          sign: state.profileInfo.sign,
                          onSave: (String desc, String work, String education) {
                            _bloc.add(ProfileUpdateAboutMeEvent(
                              desc: desc,
                              work: work,
                              education: education,
                            ));
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const ProfileSurveyTip(),
                        const SizedBox(
                          height: 20,
                        ),
                        ProfileTestBloc(
                          loadData: (info) {
                            _bloc.add(ProfileLoadAdditionalEvent(info: info));
                          },
                          info: state.profileInfo.additionalInfo,
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          }
          return Center(
            child: LoadingAnimationWidget.twoRotatingArc(
              color: Theme.of(context).primaryColor,
              size: 50,
            ),
          );
        },
      ),
    );
  }

  void _photoListener() {
    if (controller.offset > 200) {
      if (!isHidePhoto) {
        setState(() {
          isHidePhoto = !isHidePhoto;
        });
      }
    }
    if (controller.offset < 200) {
      if (isHidePhoto) {
        setState(() {
          isHidePhoto = !isHidePhoto;
        });
      }
    }
  }
}
