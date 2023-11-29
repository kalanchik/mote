part of 'dates_bloc.dart';

abstract class DatesState extends Equatable {}

class DatesLoadingState extends DatesState {
  @override
  List<Object?> get props => [];
}

class DatesLoadedState extends DatesState {
  DatesLoadedState({required this.myDates, required this.myDateInvite});

  final List myDates;
  final List myDateInvite;

  @override
  List<Object?> get props => [
        myDates,
        myDateInvite,
      ];
}

class DatesLoadingFilureState extends DatesState {
  @override
  List<Object?> get props => [];
}

class DatesInitial extends DatesState {
  @override
  List<Object?> get props => [];
}
