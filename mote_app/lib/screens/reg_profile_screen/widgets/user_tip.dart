import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mote_app/utils/constants/color_pallete.dart';
import 'package:mote_app/utils/theme/theme.dart';

class UserTip extends StatelessWidget {
  final String label;
  final bool isUpload;
  const UserTip({super.key, required this.label, required this.isUpload});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return isUpload
        ? const SizedBox.shrink()
        : Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  color: isLight(context) ? TColor.lightGrey : TColor.darkGrey,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    const Icon(Iconsax.info_circle),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: Text(
                        label,
                        style: theme.textTheme.bodyLarge,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          );
  }
}
