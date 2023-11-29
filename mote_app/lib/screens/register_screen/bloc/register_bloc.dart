import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mote_app/router/router.dart';
import 'package:mote_app/services/email_verify/email_verify.dart';
import 'package:mote_app/services/registration/registation.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterStartEvent>((event, emit) async {
      emit(RegisterStart());
      // Регистрируем пользователя
      final register = await AuthService.registerUser(
        password: event.pass,
        email: event.email,
        name: event.name,
        nickName: event.username,
        phone: event.phone,
        age: event.age,
        gender: event.gender,
      );
      if (register == true) {
        // Сохраняем данные для входа
        await AuthService.saveUserData(
          email: event.email,
          password: event.pass,
        );
        // Создаем код
        final verCode = EmailVerification.generateCode();
        // Отправляем код на почту
        await EmailVerification.sendMessage(email: event.email, code: verCode);
        // Идем на страницу с подтверждением
        await event.context.router.pushAndPopUntil(
          PhoneVerifyRoute(verCode: verCode, email: event.email),
          predicate: (_) => false,
        );
      }
      if (register == false) {
        ScaffoldMessenger.of(event.context).showSnackBar(
          const SnackBar(
            content: Text('Проверьте подключение к интернету'),
          ),
        );
        emit(RegisterFilure());
        return;
      }
      if (register is String) {
        ScaffoldMessenger.of(event.context).showSnackBar(
          SnackBar(
            content: Text(register),
          ),
        );
        emit(RegisterFilure());
      }
    });
  }
}
