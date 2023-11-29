part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class ProfileLoadingEvent extends ProfileEvent {
  @override
  List<Object?> get props => [];
}

class ProfileUpdateAboutMeEvent extends ProfileEvent {
  final String desc;
  final String work;
  final String education;

  ProfileUpdateAboutMeEvent(
      {required this.desc, required this.work, required this.education});
  @override
  List<Object?> get props => [
        desc,
        work,
        education,
      ];
}

class ProfileLoadAdditionalEvent extends ProfileEvent {
  final Map<int, String> info;

  ProfileLoadAdditionalEvent({required this.info});
  @override
  List<Object?> get props => [];
}
