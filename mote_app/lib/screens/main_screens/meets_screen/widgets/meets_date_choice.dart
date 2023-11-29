import 'package:flutter/material.dart';
import 'package:mote_app/utils/validators/meet_date_validator.dart';
import 'package:mote_app/utils/validators/meeting_time_validator.dart';

class MeetsDateChoice extends StatefulWidget {
  final TextEditingController controller;
  final TextEditingController timeController;
  const MeetsDateChoice(
      {super.key, required this.controller, required this.timeController});

  @override
  State<MeetsDateChoice> createState() => _MeetsDateChoiceState();
}

class _MeetsDateChoiceState extends State<MeetsDateChoice> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Дата и время встречи',
                style: theme.textTheme.headlineSmall,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  validator: MeetingDateValidator.validate,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (value) {},
                  controller: widget.controller,
                  keyboardType: TextInputType.datetime,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    hintText: 'Введите дату в формате ДД.ММ.ГГГГ',
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: TextFormField(
                  validator: MeetingTimeValidator.validate,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (value) {},
                  controller: widget.timeController,
                  keyboardType: TextInputType.datetime,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    hintText: 'Введите время в формате ЧЧ:мм',
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
