import 'package:flutter/material.dart';
import 'package:mote_app/screens/create_date_screen/widgets/choice_date.dart';
import 'package:mote_app/screens/create_date_screen/widgets/choice_people_gender.dart';
import 'package:mote_app/screens/create_date_screen/widgets/choice_place.dart';
import 'package:mote_app/screens/create_date_screen/widgets/choice_time.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class AnonDateContent extends StatefulWidget {
  final void Function(String gender) setGender;
  final void Function(Point point) setPlace;
  final void Function(DateTime date) setDate;
  final void Function(TimeOfDay time) setTime;
  final TextEditingController controller;
  final VoidCallback updateDesc;
  const AnonDateContent({
    super.key,
    required this.setGender,
    required this.setPlace,
    required this.setDate,
    required this.setTime,
    required this.controller,
    required this.updateDesc,
  });

  @override
  State<AnonDateContent> createState() => _AnonDateContentState();
}

class _AnonDateContentState extends State<AnonDateContent> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        ChoicePeopleGender(
          setGender: widget.setGender,
        ),
        const SizedBox(
          height: 15,
        ),
        ChoicePlace(
          setPlace: widget.setPlace,
        ),
        const SizedBox(
          height: 10,
        ),
        ChoiceDate(
          setDate: widget.setDate,
        ),
        const SizedBox(
          height: 10,
        ),
        ChoiceTime(
          setTime: widget.setTime,
        ),
        const SizedBox(
          height: 15,
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Описание',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '${widget.controller.text.trim().length}/200',
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  width: 3,
                  color: TSetColor.backgroundColor(context),
                ),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 100,
                ),
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {});
                    widget.updateDesc();
                  },
                  controller: widget.controller,
                  maxLines: null,
                  decoration: const InputDecoration(
                    hintText: 'Расскажи о том, чем хочешь заняться',
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
