part of 'login_bloc.dart';

abstract class LoginState extends Equatable {}

class LoginCheckState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginAuthState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginAuthFailureState extends LoginState {
  @override
  List<Object?> get props => [];
}
