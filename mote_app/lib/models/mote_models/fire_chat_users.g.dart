// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fire_chat_users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FireChatUsers _$FireChatUsersFromJson(Map<String, dynamic> json) =>
    FireChatUsers(
      currentUserId: json['currentUserId'] as String,
      currentUserName: json['currentUserName'] as String,
      currentUserPhoto: json['currentUserPhoto'] as String,
      user2Id: json['user2Id'] as String,
      user2Name: json['user2Name'] as String,
      user2Photo: json['user2Photo'] as String,
    );

Map<String, dynamic> _$FireChatUsersToJson(FireChatUsers instance) =>
    <String, dynamic>{
      'currentUserId': instance.currentUserId,
      'currentUserName': instance.currentUserName,
      'currentUserPhoto': instance.currentUserPhoto,
      'user2Id': instance.user2Id,
      'user2Name': instance.user2Name,
      'user2Photo': instance.user2Photo,
    };
