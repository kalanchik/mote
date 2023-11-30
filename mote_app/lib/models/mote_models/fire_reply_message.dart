import 'package:chatview/chatview.dart';
import 'package:json_annotation/json_annotation.dart';

class FireReplyMessage {
  /// Provides reply message.
  final String message;

  /// Provides user id of who replied message.
  final String replyBy;

  /// Provides user id of whom to reply.
  final String replyTo;
  final MessageType messageType;

  /// Provides max duration for recorded voice message.
  final Duration? voiceMessageDuration;

  /// Id of message, it replies to.
  final String messageId;

  const FireReplyMessage({
    this.messageId = '',
    this.message = '',
    this.replyTo = '',
    this.replyBy = '',
    this.messageType = MessageType.text,
    this.voiceMessageDuration,
  });

  factory FireReplyMessage.fromJson(Map<String, dynamic> json) =>
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

  Map<String, dynamic> toJson() => _$FireReplyMessageToJson(this);

  Map<String, dynamic> _$FireReplyMessageToJson(FireReplyMessage instance) =>
      <String, dynamic>{
        'message': instance.message,
        'replyBy': instance.replyBy,
        'replyTo': instance.replyTo,
        'messageType': _$MessageTypeEnumMap[instance.messageType]!,
        'voiceMessageDuration': instance.voiceMessageDuration?.inMicroseconds,
        'messageId': instance.messageId,
      };
}

const _$MessageTypeEnumMap = {
  MessageType.image: 'image',
  MessageType.text: 'text',
  MessageType.voice: 'voice',
  MessageType.custom: 'custom',
};
