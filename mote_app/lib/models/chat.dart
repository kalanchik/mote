import 'package:mote_app/models/message.dart';
import 'package:mote_app/models/user_model.dart';

class Chat {
  final User user1;
  final User user2;
  final List<Message> messages;

  Chat({required this.user1, required this.user2, required this.messages});
}
