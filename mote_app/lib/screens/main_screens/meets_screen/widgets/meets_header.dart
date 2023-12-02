import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mote_app/router/router.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

class MeetsHeader extends StatelessWidget {
  final int pageIndex;
  final void Function(int index) changeIndex;
  const MeetsHeader({
    super.key,
    required this.changeIndex,
    required this.pageIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildHeader(pageIndex, context),
          Row(
            children: AnimateList(
              effects: [],
              children: [
                const SizedBox(
                  width: 8,
                ),
                GestureDetector(
                  onTap: () {
                    changeIndex(1);
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        colors: [
                          Colors.red,
                          Theme.of(context).primaryColor,
                        ],
                      ),
                    ),
                    child: Icon(
                      Ionicons.search_sharp,
                      color: TSetColor.buttonTextColor(context),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                GestureDetector(
                  onTap: () {
                    AutoRouter.of(context).push(const CreateMeetRoute());
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        colors: [
                          Colors.red,
                          Theme.of(context).primaryColor,
                        ],
                      ),
                    ),
                    child: Icon(
                      Ionicons.add_sharp,
                      color: TSetColor.buttonTextColor(context),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget _buildHeader(int pageIndex, BuildContext context) {
  final theme = Theme.of(context);
  final headerMap = <int, String>{
    0: 'Встречи',
    1: 'Поиск',
    2: 'Создать',
  };

  return Text(
    headerMap[pageIndex]!,
    style: theme.textTheme.headlineLarge,
  );
}
