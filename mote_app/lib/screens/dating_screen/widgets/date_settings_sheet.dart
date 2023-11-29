import 'package:flutter/material.dart';
import 'package:mote_app/screens/dating_screen/widgets/age_choice.dart';
import 'package:mote_app/screens/dating_screen/widgets/select_find_gender.dart';
import 'package:mote_app/screens/dating_screen/widgets/target_date.dart';

class DateSettingsSheet extends StatelessWidget {
  const DateSettingsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      maxChildSize: 0.7,
      minChildSize: 0.3,
      builder: (context, scrollController) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Фильтры',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
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
              const Divider(
                height: 10,
              ),
              const SelectFindGender(),
              const SizedBox(
                height: 15,
              ),
              const AgeChoice(),
              const SizedBox(
                height: 15,
              ),
              const TargetDate(),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  // TODO: Save search settings
                  Navigator.of(context).pop();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 50,
                  width: 300,
                  child: const Center(
                    child: Text(
                      'Сохранить',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
