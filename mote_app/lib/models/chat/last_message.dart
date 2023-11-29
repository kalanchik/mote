import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'last_message.g.dart';

@JsonSerializable()
class LastMessage {
  LastMessage({
    required this.message,
    required this.createdAt,
  });

  final String message;
  final DateTime createdAt;

  factory LastMessage.fromJson(Map<String, dynamic> json) =>
      _$LastMessageFromJson(json);

  Map<String, dynamic> toJson() => _$LastMessageToJson(this);
}
