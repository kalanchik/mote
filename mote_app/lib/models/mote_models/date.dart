import 'package:flutter/material.dart';

class Date {
  Date({
    required this.id,
    required this.dateType,
    required this.user1,
    required this.user2,
    required this.location,
    required this.dateDateTime,
    required this.startTime,
    required this.description,
    required this.dateState,
    this.user1Feedback,
    this.user2Feedback,
  });

  final String id; // id свидания

  final DateType dateType; // Вид свидания Вслепую или Обычное

  final Map<String, dynamic> user1; // Создатель UserInfo
  final Map<String, dynamic> user2; // Присоединившийся

  final DateLocation location; // Место свидания
  final DateTime dateDateTime; // Дата  свидания
  final TimeOfDay startTime; // Время свидания
  final String description; // Описание свидания

  final UserFeedBack? user1Feedback; // Оценка создателя
  final UserFeedBack? user2Feedback; // Оценка присоединившегося

  final DateState dateState; // Состояние свидания
}

class AgeRange {
  AgeRange({
    required this.minAge,
    required this.maxAge,
  });

  final int minAge;
  final int maxAge;
}

class DateLocation {
  DateLocation({
    required this.latitude,
    required this.longitude,
  });

  final double latitude; // Широта
  final double longitude; // Долгота
}

class UserFeedBack {
  final int rating; // Оценка свидания пользователем
  final String comments; // Комментарий к оценке

  UserFeedBack({
    required this.rating,
    required this.comments,
  });
}

class DateState {
  DateState({required this.status, required this.updateTime});

  final DateStatus status; // Состояние которое будет меняться
  final DateTime updateTime; // Время последнего обновления состояния
}

enum DateStatus {
  waitUser,
  soonDate,
  date,
  waitFeedback,
}

enum DateType {
  blind, // Вслепую
  regular, // Обычное
}
