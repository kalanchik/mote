part of 'reg_profile_bloc.dart';

abstract class RegProfileEvent extends Equatable {}

class RegProfileStartEvent extends RegProfileEvent {
  @override
  List<Object?> get props => [];
}

class RegProfileRegisterEvent extends RegProfileEvent {
  final String name;
  final int age;
  final String sign;
  final List<String> interests;
  final String desc;
  final String findGender;
  final List<File> photos;
  final BuildContext context;

  RegProfileRegisterEvent({
    required this.name,
    required this.age,
    required this.sign,
    required this.interests,
    required this.desc,
    required this.findGender,
    required this.photos,
    required this.context,
  });
  @override
  List<Object?> get props => [
        name,
        age,
        interests,
        desc,
        findGender,
        photos,
      ];
}
