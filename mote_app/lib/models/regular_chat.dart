import 'package:mote_app/models/chat_model.dart';
import 'package:mote_app/models/message_model.dart';
import 'package:mote_app/models/user_info.dart';

// Статусы для обычного чата
enum RegularChatStatus { invite, chatting, closed }

class RegularChat implements Chat {
  RegularChat({
    required this.id,
    required this.messages,
    required this.user1,
    required this.user2,
    required this.status,
  });

  final String id; // Идетефикатор чата
  final List<MessageModel> messages; // Сообщения
  final UserInfo user1; // Пользователь №1
  final UserInfo user2; // Пользователь №2
  RegularChatStatus status; // Статус чата

  // Отрпавка сообщений
  @override
  void sendMessage() {}

  // Изменение статуса
  @override
  void changeStatus() {}

  // Закрыть чат и удалить
  @override
  void closeChat() {}

  @override
  void setUser2() {}
}
