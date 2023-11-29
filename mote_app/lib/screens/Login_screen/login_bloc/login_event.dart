part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {}

class LoginAuthCheckEvent extends LoginEvent {
  final BuildContext context;

  LoginAuthCheckEvent({required this.context});
  @override
  List<Object?> get props => [context];
}

class LoginAuthEvent extends LoginEvent {
  final String username;
  final String password;
  final BuildContext context;

  LoginAuthEvent({
    required this.context,
    required this.username,
    required this.password,
  });
  @override
  List<Object?> get props => [username, password, context];
}
