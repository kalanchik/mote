import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mote_app/models/user/profile_info.dart';
import 'package:mote_app/services/account_services/account_services.dart';
import 'package:mote_app/utils/feedback/feedback.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileLoadingEvent>((event, emit) async {
      var result = await AccountServices.getProfileInfo();
      if (result != null) {
        emit(ProfileLoadedState(result));
        return;
      }
      FeedBack.showToast(complete: false, msg: 'Не удалось загрузить данные');
      emit(ProfileLoadingFailureState());
    });
    on<ProfileUpdateAboutMeEvent>((event, emit) async {
      emit(ProfileUpdateDateState());
      var resultData = await AccountServices.updateAboutMe(
          desc: event.desc, work: event.work, education: event.education);
      if (resultData != true) {
        FeedBack.showToast(complete: false, msg: 'Не удалось обновить данные');
      }
      super.add(ProfileLoadingEvent());
    });
    on<ProfileLoadAdditionalEvent>((event, emit) async {
      emit(ProfileUpdateDateState());
      var resultData = await AccountServices.saveAdditionalInfo(
        info: event.info,
      );
      if (resultData != true) {
        FeedBack.showToast(complete: false, msg: 'Не удалось обновить данные');
      }
      super.add(ProfileLoadingEvent());
    });
  }
}
