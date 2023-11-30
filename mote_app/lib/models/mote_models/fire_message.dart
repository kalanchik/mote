import 'package:chatview/chatview.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mote_app/models/mote_models/fire_reaction.dart';
import 'package:mote_app/models/mote_models/fire_reply_message.dart';

class FireMessage extends Equatable {
  /// Provides id
  final String id;

  /// Used for accessing widget's render box.
  @JsonKey(includeFromJson: false, includeToJson: false)
  final GlobalKey key;

  /// Provides actual message it will be text or image/audio file path.
  final String message;

  /// Provides message created date time.
  final DateTime createdAt;

  /// Provides id of sender of message.
  final String sendBy;

  /// Provides reply message if user triggers any reply on any message.
  final FireReplyMessage replyMessage;

  /// Represents reaction on message.
  final FireReaction reaction;

  /// Provides message type.
  final MessageType messageType;

  /// Status of the message.
  @JsonKey(includeFromJson: false, includeToJson: false)
  final ValueNotifier<MessageStatus> _status;

  /// Provides max duration for recorded voice message.
  final Duration? voiceMessageDuration;

  FireMessage({
    this.id = '',
    required this.message,
    required this.createdAt,
    required this.sendBy,
    this.replyMessage = const FireReplyMessage(),
    FireReaction? reaction,
    this.messageType = MessageType.text,
    this.voiceMessageDuration,
    MessageStatus status = MessageStatus.pending,
  })  : reaction = reaction ?? FireReaction(reactions: [], reactedUserIds: []),
        key = GlobalKey(),
        _status = ValueNotifier(status),
        assert(
          (messageType.isVoice
              ? ((defaultTargetPlatform == TargetPlatform.iOS ||
                  defaultTargetPlatform == TargetPlatform.android))
              : true),
          'Voice messages are only supported with android and ios platform',
        );

  /// curret messageStatus
  MessageStatus get status => _status.value;

  /// For [MessageStatus] ValueNotfier which is used to for rebuilds
  /// when state changes.
  /// Using ValueNotfier to avoid usage of setState((){}) in order
  /// rerender messages with new receipts.
  ValueNotifier<MessageStatus> get statusNotifier => _status;

  /// This setter can be used to update message receipts, after which the configured
  /// builders will be updated.
  set setStatus(MessageStatus messageStatus) {
    _status.value = messageStatus;
  }

  factory FireMessage.fromJson(Map<String, dynamic> json) => FireMessage(
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

  Map<String, dynamic> toJson() => _$FireMessageToJson(this);

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

  @override
  List<Object?> get props => [
        id,
        key,
        message,
        createdAt,
        sendBy,
        replyMessage,
        sendBy,
        replyMessage,
        reaction,
        messageType,
        voiceMessageDuration,
      ];
}

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
