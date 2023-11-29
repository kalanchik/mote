import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mote_app/screens/profile/widgets/sheet_user_form.dart';
import 'package:mote_app/screens/profile/widgets/test_form_card.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

class ProfileTestBloc extends StatelessWidget {
  final void Function(Map<int, String> info) loadData;
  final Map<int, String> info;
  const ProfileTestBloc({
    super.key,
    required this.loadData,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Дополнительно',
                style: theme.textTheme.headlineMedium,
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Wrap(
            direction: Axis.horizontal,
            spacing: 10,
            runSpacing: 10.0,
            children: [
              checkInfo(info, 0)
                  ? TestFormCard(
                      labelText: info[0]!,
                      iconData: Ionicons.help_outline,
                    )
                  : const SizedBox.shrink(),
              checkInfo(info, 1)
                  ? TestFormCard(
                      labelText: info[1]!,
                      iconData: Ionicons.heart_outline,
                    )
                  : const SizedBox.shrink(),
              checkInfo(info, 2)
                  ? TestFormCard(
                      labelText: info[2]!,
                      iconData: Ionicons.cash_outline,
                    )
                  : const SizedBox.shrink(),
              checkInfo(info, 3)
                  ? TestFormCard(
                      labelText: info[3]!,
                      iconData: Ionicons.brush_outline,
                    )
                  : const SizedBox.shrink(),
              checkInfo(info, 4)
                  ? TestFormCard(
                      labelText: info[4]!,
                      iconData: Ionicons.beer_outline,
                    )
                  : const SizedBox.shrink(),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: BoxDecoration(
              color: TSetColor.onBackgroundColor(context),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        'Пройди опрос, чтобы твоя анкета собирала больше лайков',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        showDragHandle: false,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) => SheetUserForm(
                          loadData: loadData,
                        ),
                        isScrollControlled: true,
                      );
                    },
                    child: const Text('Пройти'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  bool checkInfo(Map<int, String> info, int index) {
    if (info.isNotEmpty) {
      return true;
    }
    return false;
  }
}
