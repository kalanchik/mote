// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fire_chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FireChat _$FireChatFromJson(Map<String, dynamic> json) => FireChat(
      users: (json['users'] as List<dynamic>).map((e) => e as String).toList(),
      name: json['name'] as String,
      mainPhoto: json['mainPhoto'] as String,
      id: json['id'] as String,
      status: json['status'] as String,
      lastMessage: json['lastMessage'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$FireChatToJson(FireChat instance) => <String, dynamic>{
      'id': instance.id,
      'users': instance.users,
      'name': instance.name,
      'mainPhoto': instance.mainPhoto,
      'status': instance.status,
      'lastMessage': instance.lastMessage,
    };
