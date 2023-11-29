import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

class FriendSheet extends StatefulWidget {
  final void Function(Map<String, String> user) addUser;
  final List myFriends;
  const FriendSheet({
    super.key,
    required this.addUser,
    required this.myFriends,
  });

  @override
  State<FriendSheet> createState() => _FriendSheetState();
}

class _FriendSheetState extends State<FriendSheet> {
  String name = '';
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: TSetColor.backgroundColor(context),
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Друзья',
                  style: theme.textTheme.headlineLarge,
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(
                      Ionicons.close,
                      color: Colors.grey,
                      size: 25,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: 'Имя',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: SizedBox(
                child: ListView.builder(
                  itemCount: widget.myFriends.length,
                  itemBuilder: (context, index) {
                    final user = widget.myFriends[index] as Map<String, String>;
                    if (name.isEmpty) {
                      return Material(
                        color: Colors.transparent,
                        child: ListTile(
                          onTap: () {
                            widget.addUser(user);
                          },
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: NetworkImage(user['mainPhoto']!),
                          ),
                          title: Text(
                            user['name']!,
                          ),
                        ),
                      );
                    }
                    if (user['name']
                        .toString()
                        .toLowerCase()
                        .startsWith(name.toLowerCase())) {
                      return Material(
                        color: Colors.transparent,
                        child: ListTile(
                          onTap: () {
                            widget.addUser(user);
                          },
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: NetworkImage(user['mainPhoto']!),
                          ),
                          title: Text(
                            user['name']!,
                          ),
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
