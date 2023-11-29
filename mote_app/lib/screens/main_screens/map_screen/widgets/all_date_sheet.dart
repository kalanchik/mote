import 'package:flutter/material.dart';
import 'package:mote_app/screens/main_screens/map_screen/widgets/all_date_sheet_find.dart';
import 'package:mote_app/screens/main_screens/map_screen/widgets/all_date_sheet_header.dart';
import 'package:mote_app/screens/main_screens/map_screen/widgets/all_date_sheet_my_date.dart';

class AllDateSheet extends StatefulWidget {
  final ScrollController controller;
  const AllDateSheet({super.key, required this.controller});

  @override
  State<AllDateSheet> createState() => _AllDateSheetState();
}

class _AllDateSheetState extends State<AllDateSheet> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(20),
      ),
      child: SingleChildScrollView(
        controller: widget.controller,
        child: const Column(
          children: [
            AllDateSheetHeader(),
            SizedBox(
              height: 10,
            ),
            AllDateSheetMyDate(),
            SizedBox(
              height: 10,
            ),
            AllDateSheetFind(),
          ],
        ),
      ),
    );
  }
}
