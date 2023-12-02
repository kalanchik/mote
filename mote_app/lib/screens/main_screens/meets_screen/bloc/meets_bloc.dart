import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mote_app/models/meets_models.dart';

part 'meets_event.dart';
part 'meets_state.dart';

class MeetsBloc extends Bloc<MeetsEvent, MeetsState> {
  MeetsBloc() : super(MeetsInitial()) {
    on<MeetsLoadingMeets>((event, emit) async {
      emit(MeetsLoadingMeetsState());
      emit(MeetsLoadedMeetsState(
        myMeetsList: [],
        findMeetsList: [],
      ));
    });
    on<MeetsCreateMeetEvent>((event, emit) async {});
    on<MeetsSaveMeetsEvent>((event, emit) async {
      emit(MeetsCreatingMeet());
      emit(MeetsCreatedMeet());
    });
  }
}
