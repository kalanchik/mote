import 'package:equatable/equatable.dart';

abstract class MeetMessage extends Equatable {}

class MeetNotify extends MeetMessage {
  MeetNotify({
    required this.messageText,
    required this.sendDate,
    required this.sendTime,
  });

  final String messageText;
  final String sendDate;
  final String sendTime;

  @override
  List<Object?> get props => [messageText, sendDate, sendTime];
}

class MeetUserMessage extends MeetMessage {
  MeetUserMessage({
    required this.messageText,
    required this.sendDate,
    required this.sendTime,
    required this.avatar,
    required this.userName,
    required this.isReceiver,
  });

  final String messageText;
  final String sendDate;
  final String sendTime;
  final String avatar;
  final String userName;
  final bool isReceiver;

  @override
  List<Object?> get props => [];
}
