import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mote_app/models/register_user.dart';
import 'package:mote_app/screens/reg_profile_screen/widgets/desc_dialog.dart';
import 'package:mote_app/utils/constants/color_pallete.dart';
import 'package:mote_app/utils/theme/theme.dart';

class DescBloc extends StatelessWidget {
  final void Function(String desc) saveDesc;
  const DescBloc({
    super.key,
    required this.saveDesc,
  });

  @override
  Widget build(BuildContext context) {
    final user = GetIt.I<RegisterUser>();
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Обо мне',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GestureDetector(
                  onTap: () => showDialog(
                    context: context,
                    builder: (context) => DescDialog(
                      saveDesc: saveDesc,
                    ),
                  ),
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Icon(
                      Iconsax.add4,
                      color: isLight(context)
                          ? TColor.whiteText
                          : TColor.darkBackground,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            user.isUploadDesc()
                ? Text(
                    user.getDesc(),
                    style: const TextStyle(),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
