part of 'new_date_bloc.dart';

abstract class NewDateState extends Equatable {
  const NewDateState();
}

class NewDateInitial extends NewDateState {
  @override
  List<Object> get props => [];
}

class NewDateCreateState extends NewDateState {
  @override
  List<Object?> get props => [];
}

class NewDateCreateCompleteState extends NewDateState {
  @override
  List<Object?> get props => [];
}

class NewDateCreateFailureState extends NewDateState {
  @override
  List<Object?> get props => [];
}
