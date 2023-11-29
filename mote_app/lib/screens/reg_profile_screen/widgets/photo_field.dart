import 'dart:io';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mote_app/screens/reg_profile_screen/widgets/upload_image_button.dart';
import 'package:mote_app/utils/constants/color_pallete.dart';
import 'package:mote_app/utils/theme/theme.dart';

class PhotoField extends StatefulWidget {
  final File? selectedImage;
  final void Function(File image, int index) onTap;
  final void Function() deleteImage;
  final int widgetIndex;
  const PhotoField({
    super.key,
    this.selectedImage,
    required this.onTap,
    required this.deleteImage,
    required this.widgetIndex,
  });

  @override
  State<PhotoField> createState() => _PhotoFieldState();
}

class _PhotoFieldState extends State<PhotoField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 120,
      decoration: widget.selectedImage == null
          ? BoxDecoration(
              color: isLight(context) ? TColor.lightGrey : TColor.darkGrey,
              borderRadius: BorderRadius.circular(20),
            )
          : BoxDecoration(
              border: Border.all(
                width: 2,
                color: Colors.black45,
              ),
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: FileImage(widget.selectedImage!),
                fit: BoxFit.cover,
              ),
            ),
      child: Stack(
        children: [
          Positioned(
            top: 2,
            right: 2,
            child: widget.selectedImage == null
                ? UploadImageButton(
                    onTap: () => _pickMultiImageFromGallery(),
                    icon: Iconsax.add,
                  )
                : UploadImageButton(
                    onTap: () => widget.deleteImage(),
                    icon: Icons.close,
                  ),
          ),
        ],
      ),
    );
  }

  Future _pickMultiImageFromGallery() async {
    final returnedImageList = await ImagePicker().pickMultiImage(
      imageQuality: 50,
      requestFullMetadata: false,
    );

    if (returnedImageList.isEmpty) return;

    var index = 0;
    if (returnedImageList.length == 1) {
      final file = File(returnedImageList[0].path);
      setState(() {
        widget.onTap(file, widget.widgetIndex);
      });
    }
    if (returnedImageList.length > 1) {
      if (returnedImageList.length < 6) {
        index = widget.widgetIndex;
        for (var file in returnedImageList) {
          setState(() {
            final image = File(file.path);
            widget.onTap(image, index);
          });
          index += 1;
          if (index == 6) break;
        }
      }
      if (returnedImageList.length >= 6) {
        for (var file in returnedImageList) {
          setState(() {
            final image = File(file.path);
            widget.onTap(image, index);
          });
          index += 1;
          if (index == 6) break;
        }
      }
    }
  }
}
