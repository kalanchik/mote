import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mote_app/models/meets_models.dart';
import 'package:mote_app/models/test_users.dart';

part 'meets_event.dart';
part 'meets_state.dart';

class MeetsBloc extends Bloc<MeetsEvent, MeetsState> {
  MeetsBloc() : super(MeetsInitial()) {
    on<MeetsLoadingMeets>((event, emit) async {
      emit(MeetsLoadingMeetsState());
      await Future.delayed(const Duration(seconds: 2));
      emit(MeetsLoadedMeetsState(
        myMeetsList: TestUsers.myMeetsList,
        findMeetsList: TestUsers.findMeetsList,
      ));
    });
    on<MeetsCreateMeetEvent>((event, emit) {
      emit(MeetsUploadPhoto(meet: event.meet));
    });
    on<MeetsSaveMeetsEvent>((event, emit) async {
      emit(MeetsCreatingMeet());
      event.meet.addNewUser(user: TestUsers.anna);
      event.meet.addNewUser(user: TestUsers.zlata);
      TestUsers.myMeetsList.add(event.meet);
      TestUsers.findMeetsList.add(event.meet);
      await Future.delayed(const Duration(seconds: 2));
      emit(MeetsCreatedMeet());
    });
  }
}
