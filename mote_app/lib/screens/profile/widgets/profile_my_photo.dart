import 'package:flutter/material.dart';
import 'package:mote_app/screens/reg_profile_screen/widgets/my_photo_sheet.dart';

class ProfileMyPhoto extends StatelessWidget {
  final List<String> photos;
  const ProfileMyPhoto({super.key, required this.photos});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Мои фото',
                  style: theme.textTheme.headlineMedium,
                ),
                // Container(
                //   width: 100,
                //   child: ElevatedButton(
                //     style: ElevatedButton.styleFrom(
                //       padding: const EdgeInsets.symmetric(vertical: 10),
                //     ),
                //     onPressed: () {
                //       _showPhotoSheet(context);
                //     },
                //     child: const Text('Изменить'),
                //   ),
                // )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: photos.length,
              itemBuilder: (context, index) {
                final image = photos[index];
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 110,
                    width: 100,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(image),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showPhotoSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      showDragHandle: false,
      builder: (context) => const MyPhotoSheet(),
    );
  }
}
