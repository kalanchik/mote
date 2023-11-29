part of 'find_chat_bloc.dart';

abstract class FindChatState extends Equatable {}

class FindChatInitial extends FindChatState {
  @override
  List<Object> get props => [];
}

class FindChatLoaded extends FindChatState {
  FindChatLoaded({required this.chatsList});
  // Список доступных чатов с сервера
  final List<AnonChatModel> chatsList;
  @override
  List<Object> get props => [chatsList];
}

class FindChatJoinChat extends FindChatState {
  FindChatJoinChat({required this.chatId});
  final int chatId;
  @override
  List<Object?> get props => [chatId];
}

class FindChatJoinChatComplete extends FindChatState {
  FindChatJoinChatComplete({required this.anonChat});
  final AnonChatModel anonChat;
  @override
  List<Object?> get props => throw UnimplementedError();
}
