part of 'chat_bloc.dart';

abstract class ChatEvent extends Equatable {}

class ChatLoading extends ChatEvent {
  final String chatId;
  final List<String> users;

  ChatLoading({
    required this.chatId,
    required this.users,
  });
  @override
  List<Object?> get props => [chatId, users];
}

class ChatSendMessage extends ChatEvent {
  final Map<String, dynamic> message;

  ChatSendMessage({required this.message});
  @override
  List<Object?> get props => [message];
}
