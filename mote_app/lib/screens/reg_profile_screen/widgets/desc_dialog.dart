import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mote_app/models/register_user.dart';
import 'package:mote_app/utils/constants/color_pallete.dart';
import 'package:mote_app/utils/theme/theme.dart';

class DescDialog extends StatefulWidget {
  final void Function(String desc) saveDesc;
  const DescDialog({super.key, required this.saveDesc});

  @override
  State<DescDialog> createState() => _DescDialogState();
}

class _DescDialogState extends State<DescDialog> {
  final TextEditingController descController = TextEditingController();
  @override
  void dispose() {
    descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      child: Container(
        decoration: BoxDecoration(
          color:
              isLight(context) ? TColor.lightBackground : TColor.darkBackground,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'О себе',
                    style: theme.textTheme.headlineMedium,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Flexible(
                child: Container(
                  width: 300,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 7,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: isLight(context)
                        ? TColor.lightBackground
                        : TColor.darkBackground,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    enableIMEPersonalizedLearning: true,
                    enableInteractiveSelection: false,
                    minLines: 3,
                    maxLines: 5,
                    controller: descController,
                    autofocus: true,
                    keyboardType: TextInputType.multiline,
                    maxLength: 300,
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Расскажи о себе ...'),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(),
                      ),
                      child: const Text(
                        'Закрыть',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        final user = GetIt.I<RegisterUser>();
                        user.setDesc(descController.text.trim());
                        widget.saveDesc(descController.text.trim());
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Сохранить',
                        style: TextStyle(),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
