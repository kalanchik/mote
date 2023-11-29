import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:mote_app/models/constants.dart';
import 'package:mote_app/screens/reg_info_screen/widgets/custom_choice_button.dart';
import 'package:mote_app/screens/reg_info_screen/widgets/forward_button.dart';
import 'package:mote_app/screens/reg_info_screen/widgets/interest_bot_sheet.dart';
import 'package:mote_app/screens/reg_info_screen/widgets/interest_button.dart';
import 'package:mote_app/screens/reg_info_screen/widgets/reg_info_appbar.dart';
import 'package:mote_app/screens/reg_info_screen/widgets/your_interest.dart';

@RoutePage()
class RegInfoScreen extends StatefulWidget {
  const RegInfoScreen({super.key});

  @override
  State<RegInfoScreen> createState() => _RegInfoScreenState();
}

class _RegInfoScreenState extends State<RegInfoScreen> {
  final List<String> selectedUserInterest = [];
  final List<String> signs = [
    '♈ Овен',
    '♉ Телец',
    '♊ Близнецы',
    '♋ Рак',
    '♌ Лев',
    '♍ Дева',
    '♎ Весы',
    '♏ Скорпион',
    '♐ Стрелец',
    '♑ Козерог',
    '♒ Водолей',
    '♓ Рыбы',
  ];

  int _selectedSignIndex = 0;
  int interestCount = 0;

  final List<List<bool>> selectBox =
      List<List<bool>>.generate(Constants.interestNameList.length, (index) {
    return List<bool>.generate(
        Constants.interestNameList[index].length, (index) => false);
  });
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: BottomBar(
        showIcon: false,
        width: MediaQuery.of(context).size.width * 0.75,
        borderRadius: BorderRadius.circular(15),
        hideOnScroll: false,
        end: -0.5,
        child: selectedUserInterest.isNotEmpty
            ? ForwardButton(
                interests: selectedUserInterest,
                sign: signs[_selectedSignIndex],
              )
            : const SizedBox.shrink(),
        body: (context, controller) => CustomScrollView(
          controller: controller,
          slivers: [
            const RegInfoAppBar(),
            const SliverToBoxAdapter(child: SizedBox(height: 30)),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Знак зодиака',
                  style: theme.textTheme.headlineMedium,
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 15)),
            ChoiceSign(
              signs: signs,
              isSelected: (int index) => _selectedSignIndex == index,
              onTap: (int index) {
                setState(() {
                  _selectedSignIndex = index;
                });
              },
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 25)),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Твои интересы',
                      style: theme.textTheme.headlineMedium,
                    ),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          showDragHandle: false,
                          context: context,
                          backgroundColor: Colors.transparent,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          isScrollControlled: true,
                          builder: (context) => InterestSheet(
                            addItem: (
                              int index1,
                              int index,
                              String item,
                            ) {
                              setState(() {
                                selectedUserInterest.add(item);
                                selectBox[index1][index] =
                                    !selectBox[index1][index];
                                interestCount += 1;
                              });
                            },
                            items: Constants.interestNameList,
                            removeItem: (int index1, int index, String item) {
                              setState(() {
                                selectedUserInterest.remove(item);
                                selectBox[index1][index] =
                                    !selectBox[index1][index];
                                interestCount -= 1;
                              });
                            },
                            isSelected: (int index, int index1) {
                              return selectBox[index][index1];
                            },
                            getCount: () => interestCount,
                          ),
                        );
                      },
                      child: InterestButton(interests: selectedUserInterest),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 15)),
            YourInterest(items: selectedUserInterest),
            const SliverToBoxAdapter(child: SizedBox(height: 120)),
          ],
        ),
      ),
    );
  }
}
