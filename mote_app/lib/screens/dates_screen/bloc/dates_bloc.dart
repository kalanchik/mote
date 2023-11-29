import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mote_app/services/account_services/account_services.dart';

part 'dates_event.dart';
part 'dates_state.dart';

class DatesBloc extends Bloc<DatesEvent, DatesState> {
  DatesBloc() : super(DatesInitial()) {
    on<DatesLoadingEvent>((event, emit) async {
      emit(DatesLoadingState());
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        emit(DatesLoadingFilureState());
        return;
      }
      final data = await AccountServices.getUserInfo(
        keys: ['myDate', 'myDateInvite'],
        uid: user.uid,
      );
      if (data.isEmpty) {
        emit(DatesLoadingFilureState());
        return;
      }
      emit(DatesLoadedState(
        myDateInvite: data['myDateInvite'] as List,
        myDates: data['myDate'] as List,
      ));
    });
  }
}
