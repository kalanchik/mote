import 'package:flutter/material.dart';
import 'package:mote_app/utils/validators/meet_desc_validator.dart';

class MeetsDescField extends StatefulWidget {
  final TextEditingController controller;
  const MeetsDescField({super.key, required this.controller});

  @override
  State<MeetsDescField> createState() => _MeetsDescFieldState();
}

class _MeetsDescFieldState extends State<MeetsDescField> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'О встрече',
                  style: theme.textTheme.headlineSmall,
                ),
                Text(
                  '${widget.controller.text.length}/300',
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            padding: const EdgeInsets.symmetric(),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 300,
              ),
              child: TextFormField(
                validator: MeetingDescriptionValidator.validate,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: widget.controller,
                maxLines: null,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: const InputDecoration(
                  hintText: 'Расскажи о том, что хочешь делать на встрече',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
