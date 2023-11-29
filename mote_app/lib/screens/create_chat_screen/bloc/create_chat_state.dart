part of 'create_chat_bloc.dart';

abstract class CreateChatState extends Equatable {}

class CreateChatInitial extends CreateChatState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class CreateChatLoadingState extends CreateChatState {
  @override
  List<Object?> get props => [];
}

class CreateChatLoadedState extends CreateChatState {
  final List myFriends;

  CreateChatLoadedState({required this.myFriends});
  @override
  List<Object?> get props => [myFriends];
}

class CreateChatFailureState extends CreateChatState {
  @override
  List<Object?> get props => [];
}

class CreateChatCreateState extends CreateChatState {
  @override
  List<Object?> get props => [];
}
