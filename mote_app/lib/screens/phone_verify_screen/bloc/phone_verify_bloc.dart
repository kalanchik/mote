import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mote_app/router/router.dart';

part 'phone_verify_event.dart';
part 'phone_verify_state.dart';

class PhoneVerifyBloc extends Bloc<PhoneVerifyEvent, PhoneVerifyState> {
  PhoneVerifyBloc() : super(PhoneVerifyInitial()) {
    on<PhoneVerifyStart>((event, emit) async {
      emit(PhoneVerifyStartState());
      await event.context.router.pushAndPopUntil(
        const RegInfoRoute(),
        predicate: (_) => false,
      );
    });
  }
}
