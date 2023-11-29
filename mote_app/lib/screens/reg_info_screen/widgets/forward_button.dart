import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mote_app/models/register_user.dart';
import 'package:mote_app/router/router.dart';
import 'package:mote_app/utils/constants/color_pallete.dart';
import 'package:mote_app/utils/theme/theme.dart';

class ForwardButton extends StatelessWidget {
  final List<String> interests;
  final String sign;
  const ForwardButton({
    super.key,
    required this.interests,
    required this.sign,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GetIt.I<RegisterUser>().setUserInterests(interests: interests);
        GetIt.I<RegisterUser>().setUserSign(sign: sign);
        AutoRouter.of(context).push(const FindGenderRoute());
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        width: MediaQuery.of(context).size.width * 0.75,
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(
                  Iconsax.forward,
                  size: 30,
                  color: isLight(context)
                      ? TColor.whiteText
                      : TColor.darkBackground,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
