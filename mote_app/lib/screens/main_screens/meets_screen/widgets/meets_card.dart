import 'package:flutter/material.dart';
import 'package:mote_app/models/meets_models.dart';

class MeetsCard extends StatelessWidget {
  final MeetsModels meet;
  final void Function() onTap;
  const MeetsCard({super.key, required this.meet, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 3,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 0,
        vertical: 2,
      ),
      decoration: const BoxDecoration(),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: FileImage(meet.imageFile!),
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                meet.name,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.headlineSmall,
              ),
            ),
            Text(
              meet.date,
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
        subtitle: Column(
          children: [
            const SizedBox(
              height: 0,
            ),
            Row(
              children: [
                Text('${meet.membersList.length} участника',
                    style: theme.textTheme.bodySmall),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
