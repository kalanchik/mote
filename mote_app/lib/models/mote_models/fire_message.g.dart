// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fire_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FireMessage _$FireMessageFromJson(Map<String, dynamic> json) => FireMessage(
      id: json['id'] as String? ?? '',
      message: json['message'] as String,
      createdAt: (json['createdAt'] as Timestamp).toDate(),
      sendBy: json['sendBy'] as String,
      replyMessage: json['replyMessage'] == null
          ? const FireReplyMessage()
          : FireReplyMessage.fromJson(
              json['replyMessage'] as Map<String, dynamic>),
      reaction: json['reaction'] == null
          ? null
          : FireReaction.fromJson(json['reaction'] as Map<String, dynamic>),
      messageType:
          $enumDecodeNullable(_$MessageTypeEnumMap, json['messageType']) ??
              MessageType.text,
      voiceMessageDuration: json['voiceMessageDuration'] == null
          ? null
          : Duration(microseconds: json['voiceMessageDuration'] as int),
      status: $enumDecodeNullable(_$MessageStatusEnumMap, json['status']) ??
          MessageStatus.pending,
    );

Map<String, dynamic> _$FireMessageToJson(FireMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'createdAt': instance.createdAt,
      'sendBy': instance.sendBy,
      'replyMessage': instance.replyMessage.toJson(),
      'reaction': instance.reaction.toJson(),
      'messageType': _$MessageTypeEnumMap[instance.messageType]!,
      'voiceMessageDuration': instance.voiceMessageDuration?.inMicroseconds,
      'status': _$MessageStatusEnumMap[instance.status]!,
    };

const _$MessageTypeEnumMap = {
  MessageType.image: 'image',
  MessageType.text: 'text',
  MessageType.voice: 'voice',
  MessageType.custom: 'custom',
};

const _$MessageStatusEnumMap = {
  MessageStatus.read: 'read',
  MessageStatus.delivered: 'delivered',
  MessageStatus.undelivered: 'undelivered',
  MessageStatus.pending: 'pending',
};
