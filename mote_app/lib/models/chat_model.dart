// Интерфейс чата
import 'package:mote_app/models/message_model.dart';

abstract class Chat {
  void sendMessage() {}

  void changeStatus() {}

  void closeChat() {}

  void setUser2() {}
}

class MeetChat implements Chat {
  MeetChat({
    required this.id,
    required this.meetId,
    required this.messages,
  });

  final String id;
  final String meetId;
  final List<MessageModel> messages;

  @override
  void changeStatus() {}

  @override
  void closeChat() {}

  @override
  void sendMessage() {}

  @override
  void setUser2() {}
}
