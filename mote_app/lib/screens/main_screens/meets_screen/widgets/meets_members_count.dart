import 'package:flutter/material.dart';
import 'package:mote_app/utils/validators/meets_part_validator.dart';

class MeetsMembersCount extends StatefulWidget {
  final TextEditingController controller;
  const MeetsMembersCount({super.key, required this.controller});

  @override
  State<MeetsMembersCount> createState() => _MeetsMembersCountState();
}

class _MeetsMembersCountState extends State<MeetsMembersCount> {
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
                'Количество участников',
                style: theme.textTheme.headlineSmall,
              ),
              _buildIcon(widget.controller.text),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            child: TextFormField(
              validator: MeetingParticipantsValidator.validate,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: (value) {
                setState(() {});
              },
              controller: widget.controller,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'от 3 до 50',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Icon _buildIcon(String text) {
    if (text.isNotEmpty) {
      try {
        var membersCount = int.parse(text);
        if (membersCount > 3 && membersCount <= 50) {
          return const Icon(
            Icons.done,
            color: Colors.green,
          );
        }
        if (membersCount < 3 || membersCount > 50) {
          return const Icon(
            Icons.error_outline,
            color: Colors.red,
          );
        }
      } catch (e) {
        return const Icon(
          Icons.error_outline,
          color: Colors.red,
        );
      }
    }
    return const Icon(
      Icons.error_outline,
      color: Colors.red,
    );
  }
}
