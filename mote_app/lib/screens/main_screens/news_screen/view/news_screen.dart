import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mote_app/screens/main_screens/news_screen/bloc/news_bloc.dart';
import 'package:mote_app/screens/main_screens/news_screen/widget/appbar_header.dart';
import 'package:mote_app/screens/main_screens/news_screen/widget/bottom_app_bar_content.dart';
import 'package:mote_app/screens/main_screens/news_screen/widget/news_category_bloc.dart';
import 'package:mote_app/screens/main_screens/news_screen/widget/news_drawer.dart';
import 'package:mote_app/screens/main_screens/news_screen/widget/welcome_banner.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

@RoutePage()
class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  int drawerIndex = 0;

  int userPhotoIndex = 0;

  late final NewsBloc _bloc;

  @override
  void initState() {
    _bloc = NewsBloc();
    _bloc.add(NewsLoadingEvnt());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      drawer: NewsDrawer(drawerIndex: drawerIndex, changeIndex: (int index) {}),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const AppBarHeader(),
      ),
      body: BlocBuilder<NewsBloc, NewsState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is NewsLoadedState) {
            return ClipRRect(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: TSetColor.backgroundColor(context),
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(30),
                  ),
                ),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    WelcomeBanner(
                      name: state.name,
                      mainPhoto: state.mainPhoto,
                    ),
                    const BottomAppBarContent(),
                    const SizedBox(height: 20),
                    const NewsCategoryBloc(),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Новости',
                                style: theme.textTheme.headlineMedium,
                              ),
                            ],
                          ),
                          state.news.isEmpty
                              ? Column(
                                  children: [
                                    const SizedBox(
                                      height: 100,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Пока ничего нет',
                                          style: theme.textTheme.bodySmall!
                                              .copyWith(
                                            fontSize: 24,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              : const SizedBox.shrink(),
                          const SizedBox(height: 200),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return Center(
            child: LoadingAnimationWidget.twoRotatingArc(
                color: Theme.of(context).primaryColor, size: 50),
          );
        },
      ),
    );
  }
}
