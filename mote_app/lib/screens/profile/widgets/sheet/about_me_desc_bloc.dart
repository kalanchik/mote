import 'package:flutter/material.dart';

class AboutMeDescBloc extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String headerText;
  final int maxLenght;
  const AboutMeDescBloc({
    super.key,
    required this.controller,
    required this.hintText,
    required this.headerText,
    required this.maxLenght,
  });

  @override
  State<AboutMeDescBloc> createState() => _AboutMeDescBlocState();
}

class _AboutMeDescBlocState extends State<AboutMeDescBloc> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.headerText,
                style: theme.textTheme.headlineSmall,
              ),
              Text(
                '${widget.controller.text.length}/${widget.maxLenght}',
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 100,
            ),
            child: TextFormField(
              maxLines: null,
              controller: widget.controller,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                hintText: widget.hintText,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
