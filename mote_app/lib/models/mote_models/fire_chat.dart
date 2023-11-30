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

  factory FireChat.fromJson(Map<String, dynamic> json) => FireChat(
        users:
            (json['users'] as List<dynamic>).map((e) => e as String).toList(),
        name: json['name'] as String,
        mainPhoto: json['mainPhoto'] as String,
        id: json['id'] as String,
        status: json['status'] as String,
        lastMessage: json['lastMessage'] as Map<String, dynamic>,
      );

  Map<String, dynamic> toJson() => _$FireChatToJson(this);

  Map<String, dynamic> _$FireChatToJson(FireChat instance) => <String, dynamic>{
        'id': instance.id,
        'users': instance.users,
        'name': instance.name,
        'mainPhoto': instance.mainPhoto,
        'status': instance.status,
        'lastMessage': instance.lastMessage,
      };
}
