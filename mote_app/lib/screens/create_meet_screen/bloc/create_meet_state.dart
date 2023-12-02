part of 'create_meet_bloc.dart';

abstract class CreateMeetState extends Equatable {}

class CreateMeetInitial extends CreateMeetState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class CreateMeetCreateMeet extends CreateMeetState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class CreateMeetChoicePhoto extends CreateMeetState {
  CreateMeetChoicePhoto({required this.id});

  final String id;

  @override
  List<Object?> get props => [];
}

class CreateMeetCompleteState extends CreateMeetState {
  @override
  List<Object?> get props => [];
}

class CreateMeetFailureState extends CreateMeetState {
  @override
  List<Object?> get props => throw UnimplementedError();
}
