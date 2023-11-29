import 'package:mote_app/models/message.dart';
import 'package:mote_app/models/user_model.dart';

class AnonChatModel {
  final int chatId;
  final String chatTheme;
  final User user1;
  User? user2;
  final String user2Gender;
  final String user1Gender;
  final String ageRange;
  final bool showGender;
  final String desc;
  final String createDate;
  final bool showAge;
  final List<Message> messages;
  String status = 'Ищем собеседника';

  AnonChatModel({
    required this.chatId,
    required this.createDate,
    required this.chatTheme,
    required this.user1,
    required this.user2Gender,
    required this.user1Gender,
    required this.ageRange,
    required this.showGender,
    required this.showAge,
    required this.desc,
    this.user2,
    required this.messages,
  });

  void activatedChat({
    required User newUser,
  }) {
    final nowDate = DateTime.now();
    status = 'Активен';
    user2 = newUser;
    messages.add(
      Message(
        userid: 999,
        message: 'Собеседник присоединился к чату',
        sendDate: '${nowDate.day}.${nowDate.month}.${nowDate.year}',
      ),
    );
  }

  void addMessage({
    required String message,
    required int id,
  }) {
    final nowDate = DateTime.now();
    messages.add(
      Message(
        userid: id,
        message: message,
        sendDate: '${nowDate.day}.${nowDate.month}.${nowDate.year}',
      ),
    );
  }
}
