import 'package:flutter/material.dart';
import 'package:mote_app/models/user_info.dart';

class NewDate {
  NewDate({
    required this.dateType,
    required this.user1,
    required this.user2Gender,
    required this.dateTime,
    required this.time,
    required this.desc,
  });
  // Вид свидания
  final DateType dateType;

  // Создатель
  final UserInfo user1;
  // Партнер
  final user2 = {};
  // Пол партнера
  final User2Gender user2Gender;

  final DateTime dateTime;
  final TimeOfDay time;

  final String desc;

  final status = DateStatus.wait;
}

enum DateStatus {
  wait,
  soon,
  start,
  feedback,
}

enum User2Gender {
  man,
  women,
}

enum DateType {
  blind,
  regular,
}
