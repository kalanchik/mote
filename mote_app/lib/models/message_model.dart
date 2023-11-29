import 'package:flutter/material.dart';

enum MessageSender {
  user1,
  user2,
  app,
}

abstract class MessageModel {
  MessageModel({
    required this.sender,
    required this.sendDate,
    required this.sendTime,
    required this.isRead,
  });

  final MessageSender sender; // Кто отправил сообщение

  final DateTime sendDate; // Дата отправки
  final TimeOfDay sendTime; // Время отправки

  bool isRead; // Прочитано или нет
}

// Наследуется от основного класса с добавлением полей ссылка на г.с. и его длительность
class VoiceMessageModel extends MessageModel {
  VoiceMessageModel({
    required this.voiceUrl,
    required this.duration,
    required super.sender,
    required super.sendDate,
    required super.sendTime,
    required super.isRead,
  });

  final String voiceUrl; // Ссылка на голосовое сообщение
  final int duration; // Длительность в секундах
}

// Наследуется от основного класса с добавлением поля текст сообщения
class TextMessageModel extends MessageModel {
  TextMessageModel({
    required this.text,
    required super.sender,
    required super.sendDate,
    required super.sendTime,
    required super.isRead,
  });

  final String text; // Текст сообщения
}

class NotificationMessageModel extends MessageModel {
  NotificationMessageModel({
    required super.sender,
    required super.sendDate,
    required super.sendTime,
    required super.isRead,
    required this.text,
  });
  final String text; // Текст сообщения
}
