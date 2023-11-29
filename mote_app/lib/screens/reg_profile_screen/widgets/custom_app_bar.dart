import 'package:flutter/material.dart';
import 'package:mote_app/screens/reg_profile_screen/widgets/photo_upload_sheet.dart';
import 'package:mote_app/screens/reg_profile_screen/widgets/user_photo_slider.dart';
import 'package:mote_app/utils/constants/color_pallete.dart';
import 'package:mote_app/utils/theme/theme.dart';

class CustomAppBar extends StatefulWidget {
  final void Function() updateScreen;
  final bool isUpload;
  const CustomAppBar({
    super.key,
    required this.updateScreen,
    required this.isUpload,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      expandedHeight: 300,
      flexibleSpace: FlexibleSpaceBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 43, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => showModalBottomSheet(
                  showDragHandle: false,
                  context: context,
                  backgroundColor: Colors.transparent,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  isScrollControlled: true,
                  builder: (context) => PhotoUploadSheet(
                    updateMainScreen: widget.updateScreen,
                    updateAppBar: () {
                      setState(() {});
                    },
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(
                    Icons.add_a_photo,
                    color: Colors.white,
                    size: 13,
                  ),
                ),
              )
            ],
          ),
        ),
        background: widget.isUpload
            ? const SizedBox(
                width: double.infinity,
                child: UserPhotoSlider(),
              )
            : Container(
                decoration: BoxDecoration(
                  color: isLight(context) ? TColor.lightGrey : TColor.darkGrey,
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(0),
                  ),
                ),
              ),
      ),
    );
  }
}
