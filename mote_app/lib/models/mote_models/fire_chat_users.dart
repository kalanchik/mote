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

  factory FireChatUsers.fromJson(Map<String, dynamic> json) => FireChatUsers(
        currentUserId: json['currentUserId'] as String,
        currentUserName: json['currentUserName'] as String,
        currentUserPhoto: json['currentUserPhoto'] as String,
        user2Id: json['user2Id'] as String,
        user2Name: json['user2Name'] as String,
        user2Photo: json['user2Photo'] as String,
      );

  Map<String, dynamic> toJson() => _$FireChatUsersToJson(this);

  Map<String, dynamic> _$FireChatUsersToJson(FireChatUsers instance) =>
      <String, dynamic>{
        'currentUserId': instance.currentUserId,
        'currentUserName': instance.currentUserName,
        'currentUserPhoto': instance.currentUserPhoto,
        'user2Id': instance.user2Id,
        'user2Name': instance.user2Name,
        'user2Photo': instance.user2Photo,
      };
}
