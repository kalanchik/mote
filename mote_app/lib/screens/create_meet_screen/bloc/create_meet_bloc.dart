import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mote_app/models/meet/meet_model.dart';
import 'package:mote_app/models/user/user_info.dart';
import 'package:mote_app/services/account_services/account_services.dart';
import 'package:mote_app/services/meet_services/meet_service.dart';
import 'package:mote_app/utils/feedback/feedback.dart';

part 'create_meet_event.dart';
part 'create_meet_state.dart';

class CreateMeetBloc extends Bloc<CreateMeetEvent, CreateMeetState> {
  CreateMeetBloc() : super(CreateMeetInitial()) {
    on<CreateMeetCreateEvent>((event, emit) async {
      emit(CreateMeetCreateMeet());
      final curUser = FirebaseAuth.instance.currentUser;
      if (curUser != null) {
        final info = await AccountServices.getInfoFromProfile(
          curUser.uid,
          ['name', 'age', 'mainPhoto'],
        ) as Map<String, dynamic>;
        final userInfo = MoteUserInfo.fromJson(info);
        final meet = MeetModel(
          id: event.id,
          name: event.name,
          desc: event.desc,
          lat: event.lat,
          long: event.long,
          maxMembers: event.maxMembers,
          meetDate: event.meetDate,
          meetTime: event.meetTime,
          users: [userInfo.toJson()],
          creator: userInfo,
          meetPhoto: '',
        );
        final result = await MeetService.createMeet(meet: meet);
        if (!result) {
          FeedBack.showToast(
            complete: false,
            msg: 'Встречу создать не удалось',
          );
        }
        if (result) {
          emit(CreateMeetChoicePhoto(id: event.id));
        }
      }
    });
    on<CreateMeetUploadPhotoEvent>((event, emit) async {
      emit(CreateMeetCreateMeet());
      final response = await MeetService.changeMeetPhoto(event.photo, event.id);
      if (response) {
        emit(CreateMeetCompleteState());
      } else {
        emit(CreateMeetFailureState());
      }
    });
  }
}
