part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class ProfileInitial extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileUpdateDateState extends ProfileState {
  @override
  List<Object?> get props => [];
}

class ProfileLoadedState extends ProfileState {
  final ProfileInfo profileInfo;

  ProfileLoadedState(this.profileInfo);
  @override
  List<Object> get props => [
    profileInfo,
  ];
}

class ProfileLoadingFailureState extends ProfileState {
  @override
  List<Object> get props => [];
}


