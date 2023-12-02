part of 'meets_bloc.dart';

abstract class MeetsState extends Equatable {}

class MeetsInitial extends MeetsState {
  @override
  List<Object> get props => [];
}

class MeetsLoadingMeetsState extends MeetsState {
  @override
  List<Object?> get props => [];
}

class MeetsLoadedMeetsState extends MeetsState {
  MeetsLoadedMeetsState({
    required this.myMeetsList,
    required this.findMeetsList,
  });
  final List<MeetsModels> myMeetsList;
  final List<MeetsModels> findMeetsList;
  @override
  List<Object?> get props => [myMeetsList, findMeetsList];
}

class MeetsCreatingMeet extends MeetsState {
  @override
  List<Object?> get props => [];
}

class MeetsUploadPhoto extends MeetsState {
  final String meetId;

  MeetsUploadPhoto({required this.meetId});
  @override
  List<Object?> get props => [meetId];
}

class MeetsCreatedMeet extends MeetsState {
  @override
  List<Object?> get props => [];
}
