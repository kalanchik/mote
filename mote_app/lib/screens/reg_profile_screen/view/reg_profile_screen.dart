import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:get_it/get_it.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mote_app/models/register_user.dart';
import 'package:mote_app/screens/reg_profile_screen/bloc/reg_profile_bloc.dart';
import 'package:mote_app/screens/reg_profile_screen/widgets/custom_app_bar.dart';
import 'package:mote_app/screens/reg_profile_screen/widgets/desc_header.dart';
import 'package:mote_app/screens/reg_profile_screen/widgets/iterests_bloc.dart';
import 'package:mote_app/screens/reg_profile_screen/widgets/my_interest.dart';
import 'package:mote_app/screens/reg_profile_screen/widgets/reg_profile_header.dart';
import 'package:mote_app/screens/reg_profile_screen/widgets/save_profile_button.dart';
import 'package:mote_app/screens/reg_profile_screen/widgets/sign_bloc.dart';
import 'package:mote_app/screens/reg_profile_screen/widgets/user_tip_sliver.dart';

@RoutePage()
class RegProfileScreen extends StatefulWidget {
  const RegProfileScreen({super.key});

  @override
  State<RegProfileScreen> createState() => _RegProfileScreenState();
}

class _RegProfileScreenState extends State<RegProfileScreen> {
  final RegisterUser user = GetIt.I<RegisterUser>();

  String? userDesc;

  bool isUploadDesc = GetIt.I<RegisterUser>().isUploadDesc();

  final _bloc = RegProfileBloc();

  @override
  void initState() {
    _bloc.add(RegProfileStartEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RegProfileBloc, RegProfileState>(
        bloc: _bloc,
        builder: (context, state) {
          late final String name;
          late final int age;
          if (state is RegProfileRegisterProfileState) {
            return Center(
              child: LoadingAnimationWidget.twoRotatingArc(
                color: Theme.of(context).primaryColor,
                size: 50,
              ),
            );
          }
          if (state is RegProfileUploadPhotoState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoadingAnimationWidget.twoRotatingArc(
                      color: Theme.of(context).primaryColor,
                      size: 50,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Загружаем фото ${state.photoCount}',
                    ),
                  ],
                )
              ],
            );
          }
          if (state is RegProfileInitial) {
            return Center(
              child: LoadingAnimationWidget.twoRotatingArc(
                color: Theme.of(context).primaryColor,
                size: 30,
              ),
            );
          }
          if (state is RegProfileRegisterState) {
            name = state.name;
            age = state.age;
          }
          return BottomBar(
            showIcon: false,
            hideOnScroll: false,
            offset: 30,
            borderRadius: BorderRadius.circular(15),
            child: user.getImageUpload()
                ? SaveProfileButton(
                    onTap: () {
                      _bloc.add(
                        RegProfileRegisterEvent(
                          name: name,
                          age: age,
                          sign: user.getSign(),
                          interests: user.getUserInterest(),
                          desc: userDesc ?? '',
                          findGender: user.getFindGender(),
                          photos: _getUserImages(),
                          context: context,
                        ),
                      );
                    },
                  )
                : const SizedBox.shrink(),
            body: (context, controller) => CustomScrollView(
              controller: controller,
              slivers: [
                CustomAppBar(
                  updateScreen: () {
                    setState(() {});
                  },
                  isUpload: user.getImageUpload(),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 20)),
                RegProfileHeader(
                  name: name,
                  age: age,
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 20)),
                UserTipSliver(
                  label: 'Загрузи свои фотографии',
                  isUpload: user.getImageUpload(),
                ),
                const InterestHeader(),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: MyInterest(
                      items: user.getUserInterest(),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 20)),
                SignBloc(sign: user.getUserInfo(param: 'sign')),
                const SliverToBoxAdapter(child: SizedBox(height: 20)),
                UserTipSliver(
                  label:
                      'Расскажи о себе, чтобы другие смогли получше тебя узнать',
                  isUpload: userDesc != null,
                ),
                DescBloc(
                  saveDesc: (String desc) {
                    setState(() {
                      userDesc = desc;
                    });
                  },
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 120,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  List<File> _getUserImages() {
    var photos = <File>[];
    var oldPhoto = user.getUserImages();
    for (var photo in oldPhoto) {
      if (photo != null) {
        photos.add(photo);
      }
    }
    return photos;
  }
}
