part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {}

// Регистрируем пользователя
class RegisterStartEvent extends RegisterEvent {
  RegisterStartEvent({
    required this.name,
    required this.username,
    required this.pass,
    required this.phone,
    required this.email,
    required this.age,
    required this.gender,
    required this.context,
  });

  final String name;
  final String username;
  final String pass;
  final String phone;
  final String email;
  final int age;
  final String gender;
  final BuildContext context;

  @override
  List<Object?> get props => [
        name,
        username,
        pass,
        phone,
        email,
        age,
        gender,
        context,
      ];
}
