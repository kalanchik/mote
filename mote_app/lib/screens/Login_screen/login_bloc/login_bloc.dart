import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mote_app/router/router.dart';
import 'package:mote_app/services/registration/registation.dart';
import 'package:mote_app/utils/feedback/feedback.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    // Проверка был ли раньше вход или нет
    on<LoginAuthCheckEvent>((event, emit) async {
      emit(LoginCheckState());
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await event.context.router.pushAndPopUntil(
          const HomeRoute(),
          predicate: (_) => false,
        );
        return;
      }
      // emit(LoginCheckState());
      // // Проверяем входил ли пользователь
      // var result = await AuthService.checkLogin();
      // if (result == true) {
      //   // Если входил, то входи по его данным
      //   var login = await AuthService.loginWithSaveData();
      //   if (login == true) {
      //     // Если войти получилось, то идем на главную
      //     await event.context.router.replaceAll([const HomeRoute()]);
      //     return;
      //   }
      //   // Если раньше не входил, то показываем экран со входом
      //   emit(LoginInitial());
      // }
      emit(LoginInitial());
    });
    on<LoginAuthEvent>((event, emit) async {
      emit(LoginAuthState());
      var result = await AuthService.loginUser(
        email: event.username,
        password: event.password,
      );
      if (result == true) {
        await AuthService.saveUserData(
          email: event.username,
          password: event.password,
        );
        await event.context.router.replaceAll([const HomeRoute()]);
        return;
      }
      if (result is String) {
        emit(LoginAuthFailureState());
        FeedBack.showToast(complete: false, msg: result);
        return;
      }
      FeedBack.showToast(complete: false, msg: 'Ошибка');
    });
  }
}
