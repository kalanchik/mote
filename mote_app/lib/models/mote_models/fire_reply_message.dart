import 'package:chatview/chatview.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fire_reply_message.g.dart';

@JsonSerializable()
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
      _$FireReplyMessageFromJson(json);

  Map<String, dynamic> toJson() => _$FireReplyMessageToJson(this);
}
