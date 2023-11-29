import 'package:flutter/material.dart';
import 'package:mote_app/screens/create_date_screen/bloc/new_date_bloc.dart';
import 'package:mote_app/utils/feedback/feedback.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class CreateDateButton extends StatefulWidget {
  final String? gender;
  final Point? place;
  final DateTime? date;
  final TimeOfDay? time;
  final int dateIndex;
  final TextEditingController descController;
  final NewDateBloc bloc;
  final BuildContext context;
  const CreateDateButton({
    super.key,
    required this.gender,
    required this.place,
    required this.date,
    required this.time,
    required this.dateIndex,
    required this.descController,
    required this.bloc,
    required this.context,
  });

  @override
  State<CreateDateButton> createState() => _CreateDateButtonState();
}

class _CreateDateButtonState extends State<CreateDateButton> {
  bool isStart = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: ElevatedButton(
          onPressed: () {
            if (widget.gender == null ||
                widget.place == null ||
                widget.date == null ||
                widget.time == null) {
              FeedBack.showToast(complete: false, msg: 'Заполни все поля');
              return;
            }
            widget.bloc.add(
              NewDateCreateEvent(
                gender: widget.gender!,
                place: widget.place!,
                date: widget.date!,
                time: widget.time!,
                dateIndex: widget.dateIndex,
                desc: widget.descController.text.trim(),
                context: widget.context,
              ),
            );
          },
          child: const Text(
            'Создать свидание',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
