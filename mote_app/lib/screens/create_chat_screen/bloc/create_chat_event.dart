part of 'create_chat_bloc.dart';

abstract class CreateChatEvent extends Equatable {}

class CreateChatLoadingEvent extends CreateChatEvent {
  @override
  List<Object?> get props => [];
}

class CreateChatCreateEvent extends CreateChatEvent {
  final String user2;
  final BuildContext context;

  CreateChatCreateEvent({required this.user2, required this.context});
  @override
  List<Object?> get props => [user2, context];
}
