import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mote_app/models/register_user.dart';
import 'package:mote_app/screens/reg_profile_screen/widgets/my_photo_appbar.dart';
import 'package:mote_app/screens/reg_profile_screen/widgets/photo_field.dart';
import 'package:mote_app/screens/reg_profile_screen/widgets/user_tip.dart';
import 'package:mote_app/utils/constants/color_pallete.dart';
import 'package:mote_app/utils/theme/theme.dart';

class PhotoUploadSheet extends StatefulWidget {
  const PhotoUploadSheet({
    super.key,
    required this.updateMainScreen,
    required this.updateAppBar,
  });

  final void Function() updateMainScreen;
  final void Function() updateAppBar;

  @override
  State<PhotoUploadSheet> createState() => _PhotoUploadSheetState();
}

class _PhotoUploadSheetState extends State<PhotoUploadSheet> {
  final RegisterUser user = GetIt.I<RegisterUser>();
  final List<File?> userImages = GetIt.I<RegisterUser>().getUserImages();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final photoCount = getPhotoCount();
    return DraggableScrollableSheet(
      initialChildSize: 0.95,
      maxChildSize: 0.95,
      minChildSize: 0.7,
      builder: (context, scrollController) => Container(
          decoration: BoxDecoration(
            color: isLight(context)
                ? TColor.lightBackground
                : TColor.darkBackground,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              const MyPhotoAppBar(),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  controller: scrollController,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Мои фото',
                            style: theme.textTheme.headlineMedium,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Wrap(
                        spacing: 7.0,
                        runSpacing: 10.0,
                        children: [
                          ...List<Widget>.generate(
                            6,
                            (index) => PhotoField(
                              onTap: (File image, int imageIndex) {
                                setState(() {
                                  userImages[imageIndex] = image;
                                });
                              },
                              widgetIndex: index,
                              selectedImage: userImages[index],
                              deleteImage: () {
                                setState(() {
                                  userImages[index] = null;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      UserTip(
                        label:
                            'Загрузи как можно больше фото, чтобы привлечь внимание к своей анкете\nСейчас добавлено $photoCount/6',
                        isUpload: false,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                child: const Text('Сохранить'),
                                onPressed: () {
                                  widget.updateAppBar();
                                  Navigator.of(context).pop();
                                  if (photoCount == 0) {
                                    user.userUploadImage(false);
                                  }
                                  if (photoCount > 0) {
                                    user.userUploadImage(true);
                                  }
                                  widget.updateMainScreen();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }

  int getPhotoCount() {
    var photoCount = 0;
    for (var element in userImages) {
      if (element != null) {
        photoCount += 1;
      }
    }
    return photoCount;
  }
}
