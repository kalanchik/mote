import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mote_app/services/date_services/date_services.dart';
import 'package:mote_app/utils/feedback/feedback.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

part 'new_date_event.dart';
part 'new_date_state.dart';

class NewDateBloc extends Bloc<NewDateEvent, NewDateState> {
  NewDateBloc() : super(NewDateInitial()) {
    on<NewDateCreateEvent>((event, emit) async {
      emit(NewDateCreateState());
      var result = await DateServices.createDate(
        dateType: event.dateIndex == 0 ? 'blind' : 'regular',
        dateGender: event.gender,
        geoPoint: {},
        dateTime: event.date,
        time: '${event.time.hour}:${event.time.minute}',
        desc: event.desc,
      );
      if (result == false) {
        FeedBack.showToast(complete: false, msg: 'Не удалось создать свидание');
      } else {
        emit(NewDateCreateCompleteState());
        ScaffoldMessenger.of(event.context).showSnackBar(
          const SnackBar(
            showCloseIcon: true,
            backgroundColor: Colors.green,
            content: Center(
              child: Text('Свидание создано!'),
            ),
          ),
        );
      }
      await AutoRouter.of(event.context).pop();
    });
  }
}
