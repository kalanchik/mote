import 'dart:io';

import 'package:chatview/chatview.dart';
import 'package:mote_app/models/chat/last_message.dart';
import 'package:mote_app/models/mote_models/fire_message.dart';
import 'package:mote_app/models/mote_models/fire_reply_message.dart';
import 'package:mote_app/services/chat/chat.dart';
import 'package:uuid/uuid.dart';

class ChatAction {
  ChatAction._();

  static Future<void> tapSend({
    required String message,
    required ReplyMessage reply,
    required MessageType type,
    required String userId,
    required String chatId,
  }) async {
    if (type == MessageType.text) {
      await _sendTextMessage(
        message: message,
        reply: reply,
        type: type,
        userId: userId,
        chatId: chatId,
      );
    }
    if (type == MessageType.image) {
      await _sendImageMessage(
        message: message,
        reply: reply,
        type: type,
        userId: userId,
        chatId: chatId,
      );
    }
    if (type == MessageType.voice) {
      await _sendVoiceMessage(
        message: message,
        reply: reply,
        type: type,
        userId: userId,
        chatId: chatId,
      );
    }
  }

  static Future<void> _sendVoiceMessage({
    required String message,
    required ReplyMessage reply,
    required MessageType type,
    required String userId,
    required String chatId,
  }) async {
    final fileName = const Uuid().v4();
    final url = await ChatService.uploadAudio(
      filePath: message,
      fileName: fileName,
    );
    if (url != null) {
      final newMessage = FireMessage(
        id: const Uuid().v4(),
        message: url,
        replyMessage: FireReplyMessage.fromJson(reply.toJson()),
        createdAt: DateTime.now(),
        sendBy: userId,
        messageType: type,
      );
      await ChatService.sendMessage(
        chatid: chatId,
        message: newMessage.toJson(),
      );
      await ChatService.sendLastMessage(
        lastMessage: LastMessage(
          message: 'Голосове сообщение 🎤',
          createdAt: DateTime.now(),
        ).toJson(),
        chatId: chatId,
      );
    }
  }

  static Future<void> _sendTextMessage({
    required String message,
    required ReplyMessage reply,
    required MessageType type,
    required String userId,
    required String chatId,
  }) async {
    final newMessage = FireMessage(
      id: const Uuid().v4(),
      message: message,
      replyMessage: FireReplyMessage.fromJson(reply.toJson()),
      createdAt: DateTime.now(),
      sendBy: userId,
    );
    await ChatService.sendMessage(
      chatid: chatId,
      message: newMessage.toJson(),
    );
    await ChatService.sendLastMessage(
      lastMessage: LastMessage(
        message: message,
        createdAt: DateTime.now(),
      ).toJson(),
      chatId: chatId,
    );
  }

  static Future<void> _sendImageMessage({
    required String message,
    required ReplyMessage reply,
    required MessageType type,
    required String userId,
    required String chatId,
  }) async {
    final fileName = const Uuid().v4();
    final url = await ChatService.uploadImage(
      photo: File(message),
      fileName: fileName,
    );
    if (url != null) {
      final newMessage = FireMessage(
        id: const Uuid().v4(),
        message: url,
        replyMessage: FireReplyMessage.fromJson(reply.toJson()),
        createdAt: DateTime.now(),
        sendBy: userId,
        messageType: type,
      );
      await ChatService.sendMessage(
        chatid: chatId,
        message: newMessage.toJson(),
      );
      await ChatService.sendLastMessage(
        lastMessage: LastMessage(
          message: '📷 Фотография',
          createdAt: DateTime.now(),
        ).toJson(),
        chatId: chatId,
      );
    }
  }
}
