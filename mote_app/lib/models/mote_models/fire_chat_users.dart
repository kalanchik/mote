import 'package:json_annotation/json_annotation.dart';

part 'fire_chat_users.g.dart';

@JsonSerializable()
class FireChatUsers {
  FireChatUsers({
    required this.currentUserId,
    required this.currentUserName,
    required this.currentUserPhoto,
    required this.user2Id,
    required this.user2Name,
    required this.user2Photo,
  });
  final String currentUserId;
  final String currentUserName;
  final String currentUserPhoto;
  final String user2Id;
  final String user2Name;
  final String user2Photo;

  factory FireChatUsers.fromJson(Map<String, dynamic> json) =>
      _$FireChatUsersFromJson(json);

  Map<String, dynamic> toJson() => _$FireChatUsersToJson(this);
}
