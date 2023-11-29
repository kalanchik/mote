import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mote_app/screens/profile/widgets/about_me_edit_sheet.dart';

class ChangeDescButton extends StatelessWidget {
  final void Function(String desc,  String work,  String education) onSave;
  const ChangeDescButton({
    super.key, required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          showDragHandle: false,
          backgroundColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
            ),
          ),
          builder: (context) =>  AboutMeEditSheet(
            onSave: onSave,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Row(
          children: [
            Icon(
              Iconsax.edit,
              size: 20,
              color: Colors.white,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              'Редактировать',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
