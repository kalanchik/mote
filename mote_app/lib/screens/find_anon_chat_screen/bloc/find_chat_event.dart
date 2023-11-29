part of 'find_chat_bloc.dart';

abstract class FindChatEvent extends Equatable {}

class FindChatLoadChatsEvent extends FindChatEvent {
  @override
  List<Object> get props => [];
}

class FindChatJoinChatEvent extends FindChatEvent {
  FindChatJoinChatEvent({required this.anonChat});
  final AnonChatModel anonChat;
  @override
  List<Object?> get props => [anonChat];
}
