import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mote_app/screens/create_meet_screen/bloc/create_meet_bloc.dart';
import 'package:mote_app/screens/main_screens/meets_screen/widgets/meets_choice_place.dart';
import 'package:mote_app/screens/main_screens/meets_screen/widgets/meets_date_choice.dart';
import 'package:mote_app/screens/main_screens/meets_screen/widgets/meets_desc_field.dart';
import 'package:mote_app/screens/main_screens/meets_screen/widgets/meets_members_count.dart';
import 'package:mote_app/screens/main_screens/meets_screen/widgets/meets_name_field.dart';
import 'package:mote_app/screens/main_screens/meets_screen/widgets/upload_photo_content.dart';
import 'package:uuid/uuid.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

@RoutePage()
class CreateMeetScreen extends StatefulWidget {
  const CreateMeetScreen({super.key});

  @override
  State<CreateMeetScreen> createState() => _CreateMeetScreenState();
}

class _CreateMeetScreenState extends State<CreateMeetScreen> {
  final nameCotroller = TextEditingController();
  final descController = TextEditingController();
  final memberController = TextEditingController();
  final dateContoller = TextEditingController();
  final timeController = TextEditingController();

  Point? choicePlace;

  late final CreateMeetBloc _bloc;

  void _deleteController() {
    nameCotroller.dispose();
    descController.dispose();
    memberController.dispose();
    dateContoller.dispose();
    timeController.dispose();
  }

  @override
  void initState() {
    _bloc = CreateMeetBloc();
    super.initState();
  }

  @override
  void dispose() {
    _deleteController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<CreateMeetBloc, CreateMeetState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is CreateMeetCreateMeet) {
            return Center(
              child: LoadingAnimationWidget.twoRotatingArc(
                color: Theme.of(context).primaryColor,
                size: 50,
              ),
            );
          }
          if (state is CreateMeetChoicePhoto) {
            return MeetsUploadPhotoContent(
              copmplete: (photo) {
                _bloc.add(
                    CreateMeetUploadPhotoEvent(id: state.id, photo: photo));
              },
            );
          }
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
                          _bloc.add(
                            CreateMeetCreateEvent(
                              id: const Uuid().v4(),
                              name: nameCotroller.text.trim(),
                              desc: descController.text.trim(),
                              lat: choicePlace!.latitude,
                              long: choicePlace!.longitude,
                              maxMembers:
                                  int.parse(memberController.text.trim()),
                              meetDate: _parseDate(dateContoller.text.trim()),
                              meetTime: timeController.text.trim(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

DateTime _parseDate(String date) {
  // Разделение строки на компоненты
  var dateComponents = date.split('.');

  // Парсинг компонентов для получения числовых значений
  var day = int.parse(dateComponents[0]);
  var month = int.parse(dateComponents[1]);
  var year = int.parse(dateComponents[2]);

  // Создание объекта DateTime
  var dateTime = DateTime(year, month, day);

  return dateTime;
}
