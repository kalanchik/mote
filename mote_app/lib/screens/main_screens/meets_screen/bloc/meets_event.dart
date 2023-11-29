part of 'meets_bloc.dart';

abstract class MeetsEvent extends Equatable {}

class MeetsLoadingMeets extends MeetsEvent {
  @override
  List<Object> get props => [];
}

class MeetsCreateMeetEvent extends MeetsEvent {
  MeetsCreateMeetEvent({required this.meet});
  final MeetsModels meet;
  @override
  List<Object?> get props => [];
}

class MeetsSaveMeetsEvent extends MeetsEvent {
  final MeetsModels meet;

  MeetsSaveMeetsEvent({required this.meet});
  @override
  List<Object?> get props => [];
}
