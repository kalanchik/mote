import 'package:flutter/material.dart';

class ChatAppBar extends StatelessWidget {
  final String userImage;
  final String userName;
  final String userStatus;
  const ChatAppBar({
    super.key,
    required this.userImage,
    required this.userName,
    required this.userStatus,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      title: InkWell(
        onTap: () {},
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(userImage),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: theme.textTheme.headlineSmall,
                ),
                Text(
                  'Была в сети недавно',
                  style: theme.textTheme.bodySmall!.copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        const SizedBox(
          width: 8,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search,
            size: 27,
            color: Colors.grey[700],
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_vert,
            size: 27,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }
}
