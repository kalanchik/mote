import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class PhotoTip extends StatelessWidget {
  final bool Function() isUpload;
  const PhotoTip({super.key, required this.isUpload});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: isUpload()
          ? const SizedBox.shrink()
          : Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Icon(
                          Iconsax.info_circle,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Загрузи свои фотографии',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
    );
  }
}
