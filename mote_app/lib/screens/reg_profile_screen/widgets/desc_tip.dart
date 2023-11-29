import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class DescTip extends StatelessWidget {
  final bool Function() isUpload;
  const DescTip({super.key, required this.isUpload});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: isUpload()
          ? const SizedBox.shrink()
          : Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Row(
                    children: [
                      Icon(Iconsax.info_circle),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Text(
                          'Расскажи о себе, чтобы другие смогли узнать тебя получше',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
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
