part of 'messanger_bloc.dart';

abstract class MessangerEvent extends Equatable {}

class MessageLoadEvent extends MessangerEvent {
  @override
  List<Object?> get props => [];
}
