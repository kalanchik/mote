import 'package:flutter/material.dart';
import 'package:mote_app/utils/validators/meet_title_validator.dart';

class MeetsNameField extends StatefulWidget {
  final TextEditingController controller;
  const MeetsNameField({super.key, required this.controller});
  @override
  State<MeetsNameField> createState() => _MeetsNameFieldState();
}

class _MeetsNameFieldState extends State<MeetsNameField> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Название',
                style: theme.textTheme.headlineSmall,
              ),
              Text(
                '${widget.controller.text.length}/30',
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: TextFormField(
            validator: MeetingTitleValidator.validate,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textAlignVertical: TextAlignVertical.center,
            onChanged: (value) {
              setState(() {});
            },
            maxLines: 1,
            controller: widget.controller,
            decoration: const InputDecoration(
              hintText: 'Название встречи',
            ),
          ),
        )
      ],
    );
  }

  Icon? _buildIcon(int lenght) {
    if (lenght > 5 && lenght <= 30) {
      return const Icon(
        Icons.done,
        color: Colors.green,
      );
    }
    if (lenght > 30) {
      return const Icon(
        Icons.error_outline,
        color: Colors.red,
      );
    }
    return null;
  }
}
