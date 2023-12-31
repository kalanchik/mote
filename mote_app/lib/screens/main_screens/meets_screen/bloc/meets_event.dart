part of 'meets_bloc.dart';

abstract class MeetsEvent extends Equatable {}

class MeetsLoadingMeets extends MeetsEvent {
  @override
  List<Object> get props => [];
}

class MeetsCreateMeetEvent extends MeetsEvent {
  MeetsCreateMeetEvent({
    required this.id,
    required this.name,
    required this.desc,
    required this.lat,
    required this.long,
    required this.maxMembers,
    required this.meetDate,
    required this.meetTime,
  });

  final String id;
  final String name;
  final String desc;
  final double lat;
  final double long;
  final int maxMembers;
  final DateTime meetDate;
  final String meetTime;

  @override
  List<Object?> get props => [
        id,
        desc,
        lat,
        long,
        maxMembers,
        meetDate,
        meetTime,
      ];
}

class MeetsSaveMeetsEvent extends MeetsEvent {
  final String id;

  MeetsSaveMeetsEvent({required this.id});
  @override
  List<Object?> get props => [id];
}

class MeetSetPhotoEvent extends MeetsEvent {
  MeetSetPhotoEvent({required this.meetId});
  final String meetId;
  @override
  List<Object?> get props => [meetId];
}
