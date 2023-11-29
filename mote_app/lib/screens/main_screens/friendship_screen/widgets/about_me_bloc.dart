import 'package:flutter/material.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

class AboutMeBloc extends StatelessWidget {
  const AboutMeBloc({super.key, required this.desc, required this.sign});

  final String desc;
  final String sign;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'О себе',
                    style: theme.textTheme.headlineMedium,
                  ),
                  Container(
                    child: Text(
                      sign,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        desc,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Divider(
                height: 5,
                color: TSetColor.onBackgroundColor(context),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
