import 'package:flutter/material.dart';
import 'package:mote_app/models/user_info.dart';
import 'package:mote_app/models/user_location.dart';

enum MeetingStatus {
  participantsNeeded,
  awaitingMeeting,
  meeting,
  meetingEnded,
}

class Meeting {
  final String id;
  final List<UserInfo> users;
  final MeetingStatus status;
  final String name;
  final String desc;
  final Location location;
  final int memberCount;
  final DateTime meetDate;
  final TimeOfDay meetTime;
  final String chatId;

  Meeting({
    required this.id,
    required this.users,
    required this.status,
    required this.name,
    this.desc = '',
    required this.location,
    required this.memberCount,
    required this.meetDate,
    required this.meetTime,
    required this.chatId,
  });
}
