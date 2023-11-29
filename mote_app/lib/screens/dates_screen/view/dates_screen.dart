import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mote_app/screens/dates_screen/bloc/dates_bloc.dart';
import 'package:mote_app/screens/dates_screen/widgets/create_date.dart';
import 'package:mote_app/screens/dates_screen/widgets/date_invite_bloc.dart';
import 'package:mote_app/screens/dates_screen/widgets/my_dates_bloc.dart';
import 'package:mote_app/screens/dates_screen/widgets/user_info_bloc.dart';
import 'package:mote_app/screens/main_screens/news_screen/widget/news_drawer.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

@RoutePage()
class DatesScreen extends StatefulWidget {
  const DatesScreen({super.key});

  @override
  State<DatesScreen> createState() => _DatesScreenState();
}

class _DatesScreenState extends State<DatesScreen> {
  late final DatesBloc _bloc;

  @override
  void initState() {
    _bloc = DatesBloc();
    _bloc.add(DatesLoadingEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: TSetColor.backgroundColor(context),
    ));
    final theme = Theme.of(context);
    return Scaffold(
      drawer: NewsDrawer(drawerIndex: 3, changeIndex: (index) {}),
      appBar: AppBar(),
      body: BlocBuilder<DatesBloc, DatesState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is DatesLoadedState) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: AnimateList(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Свидания',
                            style: theme.textTheme.headlineLarge,
                          ),
                          const CreateDateButton(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const UserInfoBloc(),
                    const SizedBox(
                      height: 25,
                    ),
                    DateInviteBloc(
                      myDateInvite: state.myDateInvite,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    MyDates(
                      myDates: state.myDates,
                    ),
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
