import 'package:flutter/material.dart';
import 'package:mote_app/models/meets_models.dart';
import 'package:mote_app/models/test_users.dart';
import 'package:mote_app/screens/main_screens/meets_screen/widgets/meets_choice_place.dart';
import 'package:mote_app/screens/main_screens/meets_screen/widgets/meets_date_choice.dart';
import 'package:mote_app/screens/main_screens/meets_screen/widgets/meets_desc_field.dart';
import 'package:mote_app/screens/main_screens/meets_screen/widgets/meets_members_count.dart';
import 'package:mote_app/screens/main_screens/meets_screen/widgets/meets_name_field.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class CreateMeetsContent extends StatefulWidget {
  final void Function(MeetsModels meet) createMeet;
  const CreateMeetsContent({super.key, required this.createMeet});

  @override
  State<CreateMeetsContent> createState() => _CreateMeetsContentState();
}

class _CreateMeetsContentState extends State<CreateMeetsContent> {
  final nameCotroller = TextEditingController();
  final descController = TextEditingController();
  final memberController = TextEditingController();
  final dateContoller = TextEditingController();
  final timeController = TextEditingController();

  Point? choicePlace;

  void _deleteController() {
    nameCotroller.dispose();
    descController.dispose();
    memberController.dispose();
    dateContoller.dispose();
    timeController.dispose();
  }

  @override
  void dispose() {
    _deleteController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MeetsNameField(
          controller: nameCotroller,
        ),
        const SizedBox(
          height: 20,
        ),
        MeetsDescField(
          controller: descController,
        ),
        const SizedBox(
          height: 20,
        ),
        MeetsChoicePlace(
          choicePlace: choicePlace,
          setPlace: (Point selectedPlace) {
            setState(() {
              choicePlace = selectedPlace;
            });
          },
        ),
        const SizedBox(
          height: 20,
        ),
        MeetsMembersCount(
          controller: memberController,
        ),
        const SizedBox(
          height: 20,
        ),
        MeetsDateChoice(
          controller: dateContoller,
          timeController: timeController,
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  child: const Text('Создать'),
                  onPressed: () {
                    final meet = MeetsModels(
                      owener: TestUsers.dima,
                      name: nameCotroller.text.trim(),
                      desc: descController.text.trim(),
                      place: 'Нижний Новгород, т.ц. Небо',
                      memCount: int.parse(memberController.text.trim()),
                      date: dateContoller.text.trim(),
                      imageFile: null,
                    );
                    meet.membersList.add(TestUsers.dima);
                    widget.createMeet(meet);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
