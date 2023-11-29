part of 'my_dates_bloc.dart';

abstract class MyDatesEvent extends Equatable {
  const MyDatesEvent();
}

class MyDatesLoadingEvent extends MyDatesEvent {
  @override
  List<Object?> get props => [];
}
