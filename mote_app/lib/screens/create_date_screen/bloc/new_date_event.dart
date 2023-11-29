part of 'new_date_bloc.dart';

abstract class NewDateEvent extends Equatable {}

class NewDateCreateEvent extends NewDateEvent {
  final String gender;
  final Point place;
  final DateTime date;
  final TimeOfDay time;
  final int dateIndex;
  final String desc;
  final BuildContext context;

  NewDateCreateEvent({
    required this.gender,
    required this.place,
    required this.date,
    required this.time,
    required this.dateIndex,
    required this.desc,
    required this.context,
  });

  @override
  List<Object?> get props => [
        gender,
        place,
        date,
        time,
      ];
}
