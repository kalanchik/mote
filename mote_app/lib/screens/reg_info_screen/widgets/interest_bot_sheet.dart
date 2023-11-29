import 'package:flutter/material.dart';
import 'package:mote_app/models/constants.dart';
import 'package:mote_app/screens/reg_info_screen/widgets/interest_box.dart';
import 'package:mote_app/screens/reg_info_screen/widgets/interest_sheet_appbar.dart';
import 'package:mote_app/utils/constants/color_pallete.dart';
import 'package:mote_app/utils/theme/theme.dart';

class InterestSheet extends StatefulWidget {
  final void Function(int index, int index1, String item) addItem;
  final void Function(int intex, int index1, String item) removeItem;
  final bool Function(int index1, int index) isSelected;
  final int Function() getCount;
  final List<List<String>> items;
  const InterestSheet({
    super.key,
    required this.addItem,
    required this.removeItem,
    required this.isSelected,
    required this.getCount,
    required this.items,
  });

  @override
  State<InterestSheet> createState() => _InterestSheetState();
}

class _InterestSheetState extends State<InterestSheet> {
  @override
  Widget build(BuildContext context) {
    var interestCount = widget.getCount();
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      maxChildSize: 0.8,
      minChildSize: 0.25,
      builder: (context, scrollController) => Container(
        decoration: BoxDecoration(
          color:
              isLight(context) ? TColor.lightBackground : TColor.darkBackground,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            InterestAppBar(interestCount: interestCount),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                controller: scrollController,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        ...List<Widget>.generate(
                          Constants.interestName.length,
                          (index1) => Column(
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Text(
                                    Constants.interestName[index1],
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Wrap(
                                alignment: WrapAlignment.start,
                                spacing: 5.0,
                                runSpacing: 15.0,
                                direction: Axis.horizontal,
                                children: [
                                  ...List.generate(
                                    widget.items[index1].length,
                                    (index) => InterestBox(
                                      label: widget.items[index1][index],
                                      onTap: () {
                                        if (!widget.isSelected(index1, index)) {
                                          if (widget.getCount() < 10) {
                                            setState(() {
                                              interestCount += 1;
                                            });
                                            widget.addItem(index1, index,
                                                widget.items[index1][index]);
                                          }
                                        } else {
                                          setState(() {
                                            interestCount -= 1;
                                          });
                                          widget.removeItem(index1, index,
                                              widget.items[index1][index]);
                                        }
                                      },
                                      isSelected: () {
                                        return widget.isSelected(index1, index);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Divider(
                                height: 2,
                                color: isLight(context)
                                    ? TColor.lightGrey
                                    : TColor.darkGrey,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
