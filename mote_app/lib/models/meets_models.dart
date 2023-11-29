import 'dart:io';

import 'package:mote_app/models/group_message_model.dart';
import 'package:mote_app/models/user_model.dart';

class MeetsModels {
  MeetsModels({
    required this.name,
    required this.desc,
    required this.place,
    required this.memCount,
    required this.date,
    required this.imageFile,
    required this.owener,
  });
  final String name;
  final String desc;
  final String place;
  final int memCount;
  final String date;
  final User owener;
  File? imageFile;
  final List<MeetMessage> messageList = [];
  final List<User> membersList = [];

  void addNewUser({required User user}) {
    final date = DateTime.now();
    if (membersList.isEmpty) {
      membersList.add(user);
      messageList.add(
        MeetNotify(
          messageText: 'Встреча создана',
          sendDate: '${date.day}.${date.month}.${date.year}',
          sendTime: '${date.hour}:${date.minute}',
        ),
      );
    }
    if (membersList.isNotEmpty) {
      membersList.add(user);
      messageList.add(
        MeetNotify(
          messageText: user.male == 'Парень'
              ? '${user.name} присоединился к встрече'
              : '${user.name} присоединилась к встрече',
          sendDate: '${date.day}.${date.month}.${date.year}',
          sendTime: '${date.hour}:${date.minute}',
        ),
      );
    }
  }
}
