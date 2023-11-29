part of 'my_dates_bloc.dart';

abstract class MyDatesState extends Equatable {}

class MyDatesInitial extends MyDatesState {
  @override
  List<Object?> get props => [];
}

class MyDatesLoadingState extends MyDatesState {
  @override
  List<Object?> get props => [];
}

class MyDatesLoadedState extends MyDatesState {
  final List myLikes;
  final List myMatch;
  final int viewsCount;
  final int likesCount;

  MyDatesLoadedState({
    required this.myLikes,
    required this.myMatch,
    required this.viewsCount,
    required this.likesCount,
  });
  @override
  List<Object?> get props => [myLikes, myMatch];
}

class MyDatesLodingFailureState extends MyDatesState {
  @override
  List<Object?> get props => [];
}
