import 'package:flutter/material.dart';
import 'package:mote_app/models/constants.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

class PromoCard extends StatelessWidget {
  final String promoText;
  final String buttonText;
  final String imageName;
  const PromoCard({
    super.key,
    required this.promoText,
    required this.buttonText,
    required this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      elevation: 0,
      color: TSetColor.onBackgroundColor(context),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      promoText,
                      style: theme.textTheme.bodyLarge,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Text(
                          buttonText,
                          style: TextStyle(
                            color: TSetColor.buttonTextColor(context),
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Image.asset(
              '${Constants.imagePath}$imageName.png',
              alignment: Alignment.bottomRight,
              height: 130,
            ),
          ],
        ),
      ),
    );
  }
}
