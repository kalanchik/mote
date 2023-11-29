import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mote_app/models/register_user.dart';
import 'package:mote_app/models/user/profile_info.dart';
import 'package:mote_app/router/router.dart';
import 'package:mote_app/services/registration/registation.dart';

part 'reg_profile_event.dart';
part 'reg_profile_state.dart';

class RegProfileBloc extends Bloc<RegProfileEvent, RegProfileState> {
  RegProfileBloc() : super(RegProfileInitial()) {
    // Стартовая загрузка
    on<RegProfileStartEvent>((event, emit) async {
      final info = await AuthService.getNameAndAge();
      emit(RegProfileRegisterState(
        name: info['name'] as String,
        age: info['age'] as int,
      ));
    });

    // Загружаем пользователя на сервер
    on<RegProfileRegisterEvent>((event, emit) async {
      var photoCount = 0;
      final photos = <String>[];
      for (var photo in event.photos) {
        emit(RegProfileUploadPhotoState(photoCount: photoCount));
        var result = await AuthService.uploadImage(
          photo: photo,
          photoNumber: photoCount,
        );
        if (result != null) {
          photos.add(result as String);
        }
        photoCount++;
      }
      emit(RegProfileRegisterProfileState());
      final profile = ProfileInfo(
        desc: event.desc,
        name: event.name,
        age: event.age,
        photos: photos,
        mainPhoto: photos[0],
        sign: event.sign,
        education: '',
        work: '',
        interests: event.interests,
        moteRating: {},
        additionalInfo: {},
      );
      await AuthService.setProfileInfo(
        profileInfo: profile.toJson(),
      );
      await GetIt.I.unregister<RegisterUser>();
      await event.context.router.replaceAll([const HomeRoute()]);
    });
  }
}
