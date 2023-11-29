part of 'reg_profile_bloc.dart';

abstract class RegProfileState extends Equatable {}

class RegProfileInitial extends RegProfileState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class RegProfileRegisterState extends RegProfileState {
  final String name;
  final int age;

  RegProfileRegisterState({
    required this.name,
    required this.age,
  });

  @override
  List<Object?> get props => [name, age];
}

class RegProfileUploadPhotoState extends RegProfileState {
  final int photoCount;

  RegProfileUploadPhotoState({required this.photoCount});
  @override
  List<Object?> get props => [photoCount];
}

class RegProfileRegisterProfileState extends RegProfileState {
  @override
  List<Object?> get props => [];
}

class RegProfileCompleteState extends RegProfileState {
  @override
  List<Object?> get props => [];
}

class RegProfileFailureState extends RegProfileState {
  @override
  List<Object?> get props => [];
}
