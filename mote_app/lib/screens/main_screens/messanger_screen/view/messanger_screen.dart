import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mote_app/screens/main_screens/messanger_screen/bloc/messanger_bloc.dart';
import 'package:mote_app/screens/main_screens/messanger_screen/widgets/messanger_header.dart';
import 'package:mote_app/screens/main_screens/messanger_screen/widgets/normal_chat.dart';
import 'package:mote_app/screens/main_screens/news_screen/widget/news_drawer.dart';

@RoutePage()
class MessangerScreen extends StatefulWidget {
  const MessangerScreen({super.key});

  @override
  State<MessangerScreen> createState() => _MessangerScreenState();
}

class _MessangerScreenState extends State<MessangerScreen> {
  late final User? user;
  late final MessangerBloc _bloc;
  int contentIndex = 0;
  @override
  void initState() {
    user = FirebaseAuth.instance.currentUser;
    _bloc = MessangerBloc(uid: user!.uid)..add(MessageLoadEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
          drawer: NewsDrawer(
            drawerIndex: 4,
            changeIndex: (index) {},
          ),
          appBar: AppBar(),
          body: BlocBuilder<MessangerBloc, MessangerState>(
            bloc: _bloc,
            builder: (context, state) {
              if (state is MessangerInitial) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                );
              }
              if (state is MessangerLoadedState) {
                if (state.chats.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        MessangerHeader(),
                      ],
                    ),
                  );
                }
                return SafeArea(
                  child: ListView.builder(
                    itemCount: state.chats.length,
                    itemBuilder: (context, index) {
                      final chat = state.chats[index];
                      if (index == 0) {
                        return Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: MessangerHeader(),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Iconsax.message,
                                    color: Colors.blue,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'Все чаты',
                                    style: theme.textTheme.headlineMedium,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            NoramlChat(chat: chat),
                          ],
                        );
                      }
                      return Container();
                    },
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          )),
    );
  }
}
