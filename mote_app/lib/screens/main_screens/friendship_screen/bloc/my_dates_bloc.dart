import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mote_app/services/account_services/account_services.dart';

part 'my_dates_event.dart';
part 'my_dates_state.dart';

class MyDatesBloc extends Bloc<MyDatesEvent, MyDatesState> {
  MyDatesBloc() : super(MyDatesInitial()) {
    on<MyDatesLoadingEvent>((event, emit) async {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        emit(MyDatesLodingFailureState());
        return;
      }
      final data = await AccountServices.getUserInfo(
        keys: ['myLikes', 'myMatch', 'viewsCount', 'likesCount'],
        uid: user.uid,
      );
      if (data.isEmpty) {
        emit(MyDatesLodingFailureState());
        return;
      }
      emit(
        MyDatesLoadedState(
          myLikes: data['myLikes'] as List,
          myMatch: data['myMatch'] as List,
          viewsCount: data['viewsCount'] as int,
          likesCount: data['likesCount'] as int,
        ),
      );
    });
  }
}
