import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

class MyPhotoSheet extends StatefulWidget {
  const MyPhotoSheet({super.key});

  @override
  State<MyPhotoSheet> createState() => _MyPhotoSheetState();
}

class _MyPhotoSheetState extends State<MyPhotoSheet> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      maxChildSize: 0.9,
      minChildSize: 0.5,
      builder: (context, controller) => Container(
        decoration: BoxDecoration(
          color: TSetColor.backgroundColor(context),
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: SingleChildScrollView(
          controller: controller,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Мои фото',
                      style: theme.textTheme.headlineLarge,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Ionicons.close_outline,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Wrap(
                  runSpacing: 10.0,
                  spacing: 5.0,
                  children: [
                    ...List<Widget>.generate(
                      6,
                      (index) => Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: 180,
                        decoration: BoxDecoration(
                          color: TSetColor.onBackgroundColor(context),
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
