part of 'messanger_bloc.dart';

abstract class MessangerState extends Equatable {}

class MessangerInitial extends MessangerState {
  @override
  List<Object> get props => [];
}

class MessangerLoadingState extends MessangerState {
  @override
  List<Object> get props => [];
}

class MessangerLoadedState extends MessangerState {
  MessangerLoadedState({required this.chats});
  final List<FireChat> chats;
  @override
  List<Object> get props => [
        chats,
      ];
}

class MessangerFailureState extends MessangerState {
  final String error;

  MessangerFailureState({required this.error});
  @override
  List<Object?> get props => [error];
}
