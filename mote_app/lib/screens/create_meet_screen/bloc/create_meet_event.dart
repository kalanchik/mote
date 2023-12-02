part of 'create_meet_bloc.dart';

abstract class CreateMeetEvent extends Equatable {}

class CreateMeetCreateEvent extends CreateMeetEvent {
  CreateMeetCreateEvent({
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
        name,
        desc,
        lat,
        long,
        maxMembers,
        meetDate,
        meetTime,
      ];
}

class CreateMeetUploadPhotoEvent extends CreateMeetEvent {
  CreateMeetUploadPhotoEvent({
    required this.id,
    required this.photo,
  });
  final String id;
  final File photo;

  @override
  List<Object?> get props => [id, photo];
}
