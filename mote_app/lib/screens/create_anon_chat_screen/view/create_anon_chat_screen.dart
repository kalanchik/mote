import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mote_app/router/router.dart';
import 'package:mote_app/screens/create_anon_chat_screen/bloc/create_anon_chat_bloc.dart';
import 'package:mote_app/screens/create_anon_chat_screen/widgets/create_anon_chat_content.dart';

@RoutePage()
class CreateAnonChatScreen extends StatefulWidget {
  const CreateAnonChatScreen({super.key});

  @override
  State<CreateAnonChatScreen> createState() => _CreateAnonChatScreenState();
}

class _CreateAnonChatScreenState extends State<CreateAnonChatScreen> {
  final CreateAnonChatBloc _bloc = CreateAnonChatBloc();
  final TextEditingController topicCotroller = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final List<String> genderList = [
    'Парень',
    'Девушка',
    'Не важно',
  ];
  final List<String> myGenderList = [
    'Парень', // Здесь должен быть переменная с полом пользователя
    'Скрыть',
  ];
  final List<String> ageButtonText = [
    'Скрыть',
    'Показать',
  ];
  final List<String> ageText = [
    'Скрыть твой возраст?',
    'Показывать твой возраст?',
  ];

  int myGenderIndex = 0;
  int genderIndex = 0;
  int ageIndex = 0;

  bool addDesc = false;

  @override
  void dispose() {
    topicCotroller.dispose();
    descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<CreateAnonChatBloc, CreateAnonChatState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is CreateAnonChatRegisterChat) {
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
                  'Регистрируем ваш чат',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineSmall,
                ),
              ],
            );
          }
          if (state is CreateAnonChatComplete) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Чат успешно создан!',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        'Когда кто-то присоединиться к чату, мы вам сообщим',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodySmall,
                      ),
                    ),
                  ],
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
                          child: const Text('К чатам'),
                          onPressed: () {
                            AutoRouter.of(context).pushAndPopUntil(
                                const AnonMessangerRoute(),
                                predicate: (_) => false);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          if (state is CreateAnonChatInitial) {
            return CreateAnonChatContent(registerChat: () {
              _bloc.add(CreateAnonChatRegister());
            });
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
