part of 'chat_bloc.dart';

abstract class ChatState extends Equatable {}

class ChatInitial extends ChatState {
  @override
  List<Object?> get props => [];
}

class ChatLoaded extends ChatState {
  final FireChatUsers fireChatUsers;
  final ChatController chatController;

  ChatLoaded({
    required this.chatController,
    required this.fireChatUsers,
  });
  @override
  List<Object?> get props => [fireChatUsers, chatController];
}

class ChatFilure extends ChatState {
  @override
  List<Object?> get props => [];
}
