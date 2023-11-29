import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mote_app/screens/create_anon_chat_screen/widgets/anon_chat_choice_my_gender.dart';
import 'package:mote_app/screens/create_anon_chat_screen/widgets/anon_chat_use2_gender.dart';
import 'package:mote_app/screens/create_anon_chat_screen/widgets/create_anon_chat_header.dart';
import 'package:mote_app/screens/create_anon_chat_screen/widgets/desc_button.dart';
import 'package:mote_app/screens/create_anon_chat_screen/widgets/desc_field.dart';
import 'package:mote_app/screens/create_anon_chat_screen/widgets/my_age.dart';
import 'package:mote_app/screens/create_anon_chat_screen/widgets/topic_field.dart';
import 'package:mote_app/screens/dating_screen/widgets/age_choice.dart';

class CreateAnonChatContent extends StatefulWidget {
  final VoidCallback registerChat;
  const CreateAnonChatContent({super.key, required this.registerChat});

  @override
  State<CreateAnonChatContent> createState() => _CreateAnonChatContentState();
}

class _CreateAnonChatContentState extends State<CreateAnonChatContent> {
  final TextEditingController topicCotroller = TextEditingController();
  final TextEditingController descController = TextEditingController();

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
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
              ),
            ],
            children: [
              const CreateAnonChatHeader(),
              const SizedBox(
                height: 15,
              ),
              TopicField(
                controller: topicCotroller,
                currentLenght: topicCotroller.text.trim().length,
                onChanged: () {
                  setState(() {});
                },
              ),
              const SizedBox(
                height: 25,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnonChatChoiceMyGender(
                    myGenderIndex: myGenderIndex,
                    changeIndex: (int newIndex) {
                      setState(() {
                        myGenderIndex = newIndex;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AnonChatUser2Gender(
                    genderIndex: genderIndex,
                    changeIndex: (int newIndex) {
                      setState(() {
                        genderIndex = newIndex;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const AgeChoice(),
              const SizedBox(
                height: 30,
              ),
              MyAge(
                index: ageIndex,
                changeIndex: (int newIndex) {
                  setState(() {
                    ageIndex = newIndex;
                  });
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Описание',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      DescButton(
                        addDesc: addDesc,
                        onTap: () {
                          setState(() {
                            addDesc = !addDesc;
                          });
                        },
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Offstage(
                    offstage: !addDesc,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 600),
                      height: addDesc ? 150 : 0,
                      curve: Curves.fastEaseInToSlowEaseOut,
                      child: DescField(controller: descController),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: widget.registerChat,
                          child: const Text('Создать чат'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
