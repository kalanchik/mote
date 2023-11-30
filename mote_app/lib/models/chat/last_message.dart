import 'package:cloud_firestore/cloud_firestore.dart';

class LastMessage {
  LastMessage({
    required this.message,
    required this.createdAt,
  });

  final String message;
  final DateTime createdAt;

  factory LastMessage.fromJson(Map<String, dynamic> json) => LastMessage(
        message: json['message'] as String,
        createdAt: (json['createdAt'] as Timestamp).toDate(),
      );

  Map<String, dynamic> toJson() => _$LastMessageToJson(this);

  Map<String, dynamic> _$LastMessageToJson(LastMessage instance) =>
      <String, dynamic>{
        'message': instance.message,
        'createdAt': instance.createdAt,
      };
}
