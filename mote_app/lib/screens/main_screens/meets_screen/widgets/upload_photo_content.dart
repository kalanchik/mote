import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MeetsUploadPhotoContent extends StatefulWidget {
  final void Function(File photo) copmplete;
  const MeetsUploadPhotoContent({super.key, required this.copmplete});

  @override
  State<MeetsUploadPhotoContent> createState() =>
      _MeetsUploadPhotoContentState();
}

class _MeetsUploadPhotoContentState extends State<MeetsUploadPhotoContent> {
  bool isUpload = false;
  File? meetImage;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Flexible(
                child: Text(
                  'Теперь выбери фотографию для встречи',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineMedium,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
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
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                child: isUpload
                    ? OutlinedButton(
                        onPressed: () {}, child: const Text('Изменить фото'))
                    : ElevatedButton(
                        child:
                            Text(isUpload ? 'Изменить фото' : 'Загрузить фото'),
                        onPressed: () async {
                          await _pickImageFromGallery();
                        },
                      ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        isUpload
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              widget.copmplete(meetImage!);
                            },
                            child: const Text('Загрузить')))
                  ],
                ),
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
      // widget.meet.imageFile = meetImage;
    });
  }
}
