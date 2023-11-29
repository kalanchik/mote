import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mote_app/screens/create_chat_screen/bloc/create_chat_bloc.dart';
import 'package:mote_app/screens/create_chat_screen/widgets/friend_sheet.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

@RoutePage()
class CreateChatScreen extends StatefulWidget {
  const CreateChatScreen({super.key});

  @override
  State<CreateChatScreen> createState() => _CreateChatScreenState();
}

class _CreateChatScreenState extends State<CreateChatScreen> {
  late final CreateChatBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = CreateChatBloc();
    _bloc.add(CreateChatLoadingEvent());
  }

  Map<String, String>? selectedUser;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<CreateChatBloc, CreateChatState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is CreateChatLoadedState) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Создать чат',
                          style: theme.textTheme.headlineLarge,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Собеседник',
                              style: theme.textTheme.bodyLarge,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                height: 55,
                                decoration: BoxDecoration(
                                  color: TSetColor.onBackgroundColor(context),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    selectedUser == null
                                        ? const Text('Собеседник не выбран')
                                        : Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    CircleAvatar(
                                                      backgroundImage:
                                                          NetworkImage(
                                                              selectedUser![
                                                                  'mainPhoto']!),
                                                    ),
                                                    const SizedBox(
                                                      width: 8,
                                                    ),
                                                    Text(
                                                      selectedUser!['name']!,
                                                    ),
                                                  ],
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      selectedUser = null;
                                                    });
                                                  },
                                                  child: const Icon(
                                                    Ionicons.trash,
                                                    color: Colors.grey,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            InkWell(
                              borderRadius: BorderRadius.circular(14),
                              onTap: () {
                                _showSheet(context, state.myFriends);
                              },
                              child: Icon(
                                Ionicons.add,
                                size: 30,
                                color: TSetColor.textColor(context),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  if (selectedUser != null) {
                                    _bloc.add(
                                      CreateChatCreateEvent(
                                        user2: selectedUser!['uid']!,
                                        context: context,
                                      ),
                                    );
                                  }
                                },
                                child: const Text('Создать'),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
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

  void _addUser(Map<String, String> user) {
    setState(() {
      selectedUser = user;
    });
  }

  void _showSheet(BuildContext context, List myFriends) {
    showModalBottomSheet(
      context: context,
      showDragHandle: false,
      backgroundColor: TSetColor.backgroundColor(context),
      isScrollControlled: false,
      builder: (context) => FriendSheet(
        addUser: _addUser,
        myFriends: myFriends,
      ),
    );
  }
}
