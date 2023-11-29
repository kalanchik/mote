import 'package:json_annotation/json_annotation.dart';
import 'package:mote_app/models/chat/last_message.dart';

part 'fire_chat.g.dart';

@JsonSerializable()
class FireChat {
  FireChat({
    required this.users,
    required this.name,
    required this.mainPhoto,
    required this.id,
    required this.status,
    required this.lastMessage,
  });

  final String id;
  final List<String> users;
  final String name;
  final String mainPhoto;
  final String status;
  final Map<String, dynamic> lastMessage;

  factory FireChat.fromJson(Map<String, dynamic> json) =>
      _$FireChatFromJson(json);

  Map<String, dynamic> toJson() => _$FireChatToJson(this);
}
