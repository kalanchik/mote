import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mote_app/screens/main_screens/friendship_screen/bloc/my_dates_bloc.dart';
import 'package:mote_app/screens/main_screens/friendship_screen/widgets/form_info.dart';
import 'package:mote_app/screens/main_screens/friendship_screen/widgets/mutual_sympathy.dart';
import 'package:mote_app/screens/main_screens/friendship_screen/widgets/my_form_button.dart';
import 'package:mote_app/screens/main_screens/friendship_screen/widgets/my_likers_bloc.dart';
import 'package:mote_app/screens/main_screens/friendship_screen/widgets/view_forms_button.dart';
import 'package:mote_app/screens/main_screens/news_screen/widget/news_drawer.dart';

@RoutePage()
class FriendShipScreen extends StatefulWidget {
  const FriendShipScreen({super.key});

  @override
  State<FriendShipScreen> createState() => _FriendShipScreenState();
}

class _FriendShipScreenState extends State<FriendShipScreen> {
  late final MyDatesBloc _bloc;

  @override
  void initState() {
    _bloc = MyDatesBloc();
    _bloc.add(MyDatesLoadingEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      drawer: NewsDrawer(
        drawerIndex: 2,
        changeIndex: (index) {},
      ),
      appBar: AppBar(),
      body: BlocBuilder<MyDatesBloc, MyDatesState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is MyDatesLoadedState) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: AnimateList(
                  delay: 100.ms,
                  interval: 50.ms,
                  effects: [
                    FadeEffect(
                      duration: 600.ms,
                      curve: Curves.fastEaseInToSlowEaseOut,
                    ),
                    SlideEffect(
                      duration: 600.ms,
                      curve: Curves.fastEaseInToSlowEaseOut,
                      begin: const Offset(0, -1),
                    ),
                  ],
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Знакомства',
                            style: theme.textTheme.headlineLarge,
                          ),
                          const ViewFormsButton(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    MyLikesBloc(
                      likeList: state.myLikes,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    MutualSympathy(myMatch: state.myMatch),
                    const SizedBox(
                      height: 15,
                    ),
                    FormInfoCard(
                      likesCount: state.likesCount,
                      viewsCount: state.viewsCount,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const MyFormButton(),
                  ],
                ),
              ),
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
}
