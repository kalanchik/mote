import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mote_app/router/router.dart';
import 'package:mote_app/screens/find_anon_chat_screen/bloc/find_chat_bloc.dart';
import 'package:mote_app/screens/find_anon_chat_screen/widgets/find_anon_chat.dart';
import 'package:mote_app/screens/find_anon_chat_screen/widgets/find_anon_chat_header.dart';
import 'package:mote_app/screens/find_anon_chat_screen/widgets/search_button.dart';

@RoutePage()
class FindAnonChatScreen extends StatefulWidget {
  const FindAnonChatScreen({super.key});

  @override
  State<FindAnonChatScreen> createState() => _FindAnonChatScreenState();
}

class _FindAnonChatScreenState extends State<FindAnonChatScreen> {
  final _bloc = FindChatBloc();
  @override
  void initState() {
    _bloc.add(FindChatLoadChatsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<FindChatBloc, FindChatState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is FindChatInitial) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            ).animate().scale(
                  delay: 400.ms,
                  duration: 600.ms,
                  curve: Curves.fastEaseInToSlowEaseOut,
                );
          }
          if (state is FindChatLoaded) {
            return SafeArea(
              child: ListView(
                children: [
                  const FindAnonChatHeader(),
                  const SizedBox(
                    height: 15,
                  ),
                  const AnonSearchButton(),
                  const SizedBox(
                    height: 30,
                  ),
                  Column(children: [
                    ...List<Widget>.generate(
                      state.chatsList.length,
                      (index) {
                        final chat = state.chatsList[index];
                        return FindAnonChat(
                          anonChat: chat,
                          joinChat: () {
                            _bloc.add(
                              FindChatJoinChatEvent(anonChat: chat),
                            );
                          },
                        );
                      },
                    ),
                  ])
                ],
              ),
            );
          }
          if (state is FindChatJoinChat) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Присоединяем вас к чату #${state.chatId}',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ).animate().scale(
                  delay: 200.ms,
                  curve: Curves.fastEaseInToSlowEaseOut,
                );
          }
          if (state is FindChatJoinChatComplete) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Вы успешно присоединились к чату!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ).animate().scale(
                      delay: 200.ms,
                      curve: Curves.fastEaseInToSlowEaseOut,
                    ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'Собеседник уже ждет твеого сообщения',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ).animate().scale(
                      delay: 200.ms,
                      curve: Curves.fastEaseInToSlowEaseOut,
                    ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          child: const Text('Перейти к чату'),
                          onPressed: () {
                            AutoRouter.of(context)
                                .push(AnonChatRoute(anonChat: state.anonChat));
                          },
                        ).animate().scale(
                              delay: 200.ms,
                              curve: Curves.fastEaseInToSlowEaseOut,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          );
        },
      ),
    );
  }
}
