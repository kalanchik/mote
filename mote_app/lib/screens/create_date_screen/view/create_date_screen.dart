import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mote_app/screens/create_date_screen/bloc/new_date_bloc.dart';
import 'package:mote_app/screens/create_date_screen/widgets/anon_date_content.dart';
import 'package:mote_app/screens/create_date_screen/widgets/create_date_button.dart';
import 'package:mote_app/screens/create_date_screen/widgets/create_date_header.dart';
import 'package:mote_app/screens/create_date_screen/widgets/create_date_info.dart';
import 'package:mote_app/screens/create_date_screen/widgets/date_selector.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

@RoutePage()
class CreateDateScreen extends StatefulWidget {
  const CreateDateScreen({super.key});

  @override
  State<CreateDateScreen> createState() => _CreateDateScreenState();
}

class _CreateDateScreenState extends State<CreateDateScreen> {
  // Анонимное или обычное
  int contentIndex = 0;

  // С кем пойдем
  String? gender;

  // Место свидания
  Point? place;

  // Дата свидания
  DateTime? date;

  // Время свидания
  TimeOfDay? time;

  // Описание для свидания
  late TextEditingController descController;

  late final NewDateBloc _bloc;

  @override
  void initState() {
    _bloc = NewDateBloc();
    descController = TextEditingController();
    descController.addListener(() {
      if (descController.text.isNotEmpty) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<NewDateBloc, NewDateState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is NewDateCreateState) {
            return Center(
              child: LoadingAnimationWidget.twoRotatingArc(
                color: Theme.of(context).primaryColor,
                size: 50,
              ),
            );
          }
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
                    ),
                  ],
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const CreateDateHeader(),
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const Row(
                            children: [
                              Flexible(
                                child: Text(
                                  'Какое свидание ты хочешь создать?',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          DateSelector(
                            onTap: (int index) {
                              setState(() {
                                contentIndex = index;
                              });
                            },
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: TSetColor.onBackgroundColor(context),
                              borderRadius: BorderRadius.only(
                                bottomLeft: const Radius.circular(15),
                                bottomRight: const Radius.circular(15),
                                topLeft: contentIndex == 0
                                    ? Radius.zero
                                    : const Radius.circular(15),
                                topRight: contentIndex == 0
                                    ? const Radius.circular(15)
                                    : Radius.zero,
                              ),
                            ),
                            child: AnonDateContent(
                              controller: descController,
                              setGender: (newGender) {
                                setState(() {
                                  gender = newGender;
                                });
                              },
                              setPlace: (point) {
                                setState(() {
                                  place = point;
                                });
                              },
                              setDate: (newDate) {
                                setState(() {
                                  date = newDate;
                                });
                              },
                              setTime: (newTime) {
                                setState(() {
                                  time = newTime;
                                });
                              },
                              updateDesc: () {
                                setState(() {});
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CreateDateInfo(
                      gender: gender,
                      place: place,
                      time: time,
                      date: date,
                      dateIndex: contentIndex,
                      descController: descController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CreateDateButton(
                      bloc: _bloc,
                      gender: gender,
                      place: place,
                      time: time,
                      date: date,
                      dateIndex: contentIndex,
                      descController: descController,
                      context: context,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
