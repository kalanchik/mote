import 'package:flutter/material.dart';
import 'package:mote_app/screens/profile/widgets/sheet/about_me_desc_bloc.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

class AboutMeEditSheet extends StatefulWidget {
  final void Function(String desc,  String work,  String education) onSave;
  const AboutMeEditSheet({super.key, required this.onSave});

  @override
  State<AboutMeEditSheet> createState() => _AboutMeEditSheetState();
}

class _AboutMeEditSheetState extends State<AboutMeEditSheet> {
  final descCotroller = TextEditingController();
  final workController = TextEditingController();
  final schoolController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      maxChildSize: 0.8,
      minChildSize: 0.2,
      builder: (context, scrollController) => Container(
        decoration: BoxDecoration(
          color: TSetColor.backgroundColor(context),
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(30),
          ),
        ),
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Редактировать',
                      style: theme.textTheme.headlineLarge,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              AboutMeDescBloc(
                controller: descCotroller,
                hintText: 'Расскажи о себе ...',
                headerText: 'Описание',
                maxLenght: 300,
              ),
              const SizedBox(
                height: 20,
              ),
              AboutMeDescBloc(
                controller: schoolController,
                hintText: 'Место учебы ...',
                headerText: 'Ты учишься?',
                maxLenght: 30,
              ),
              const SizedBox(
                height: 20,
              ),
              AboutMeDescBloc(
                controller: workController,
                hintText: 'Место работы ...',
                headerText: 'Ты работаешь?',
                maxLenght: 30,
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        child: const Text('Сохранить'),
                        onPressed: () {
                          widget.onSave(
                            descCotroller.text.trim(),
                            workController.text.trim(),
                            schoolController.text.trim(),
                          );
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }
}
