// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fire_reply_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FireReplyMessage _$FireReplyMessageFromJson(Map<String, dynamic> json) =>
    FireReplyMessage(
      messageId: json['messageId'] as String? ?? '',
      message: json['message'] as String? ?? '',
      replyTo: json['replyTo'] as String? ?? '',
      replyBy: json['replyBy'] as String? ?? '',
      messageType:
          $enumDecodeNullable(_$MessageTypeEnumMap, json['messageType']) ??
              MessageType.text,
      voiceMessageDuration: json['voiceMessageDuration'] == null
          ? null
          : Duration(microseconds: json['voiceMessageDuration'] as int),
    );

Map<String, dynamic> _$FireReplyMessageToJson(FireReplyMessage instance) =>
    <String, dynamic>{
      'message': instance.message,
      'replyBy': instance.replyBy,
      'replyTo': instance.replyTo,
      'messageType': _$MessageTypeEnumMap[instance.messageType]!,
      'voiceMessageDuration': instance.voiceMessageDuration?.inMicroseconds,
      'messageId': instance.messageId,
    };

const _$MessageTypeEnumMap = {
  MessageType.image: 'image',
  MessageType.text: 'text',
  MessageType.voice: 'voice',
  MessageType.custom: 'custom',
};
