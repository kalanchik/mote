import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mote_app/models/meets_models.dart';
import 'package:mote_app/widgets/custom_elevated_buttom.dart';

class MeetsUploadPhotoContent extends StatefulWidget {
  final MeetsModels meet;
  final void Function(MeetsModels meet) copmplete;
  const MeetsUploadPhotoContent(
      {super.key, required this.copmplete, required this.meet});

  @override
  State<MeetsUploadPhotoContent> createState() =>
      _MeetsUploadPhotoContentState();
}

class _MeetsUploadPhotoContentState extends State<MeetsUploadPhotoContent> {
  bool isUpload = false;
  File? meetImage;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 65,
              backgroundImage: meetImage != null ? FileImage(meetImage!) : null,
              backgroundColor: Theme.of(context).primaryColor,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          widget.meet.name,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        ElevatedButton(
          child: Text(isUpload ? 'Изменить фото' : 'Загрузить фото'),
          onPressed: () async {
            await _pickImageFromGallery();
          },
        ),
        const SizedBox(
          height: 20,
        ),
        isUpload
            ? CustomElevatedButton(
                labelText: 'Создать встречу',
                onTap: () => widget.copmplete(widget.meet),
              )
            : const SizedBox.shrink(),
      ],
    );
  }

  Future _pickImageFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    setState(() {
      isUpload = true;
      meetImage = File(image.path);
      widget.meet.imageFile = meetImage;
    });
  }
}
