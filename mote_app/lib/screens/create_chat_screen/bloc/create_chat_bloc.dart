import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:mote_app/services/account_services/account_services.dart';
import 'package:mote_app/services/chat/chat.dart';
import 'package:mote_app/utils/feedback/feedback.dart';

part 'create_chat_event.dart';
part 'create_chat_state.dart';

class CreateChatBloc extends Bloc<CreateChatEvent, CreateChatState> {
  CreateChatBloc() : super(CreateChatInitial()) {
    on<CreateChatLoadingEvent>((event, emit) async {
      emit(CreateChatLoadingState());
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        emit(CreateChatFailureState());
        return;
      }
      // Получаем список друзей
      final data = await AccountServices.getUserInfo(
        keys: ['myFriends'],
        uid: user.uid,
      );
      // Проверяем на то есть ли он в дате
      if (data.isEmpty) {
        emit(CreateChatFailureState());
        return;
      }
      // Список друзей
      final myFriends = data['myFriends'] as List;
      final friends = [];
      // Получаем информацию о каждом и кидаем ее в список
      for (var friend in myFriends) {
        final info =
            await AccountServices.getUserNameAndPhoto(friend.toString().trim());
        if (info.isNotEmpty) {
          info['uid'] = friend as String;
          friends.add(info);
        }
      }
      emit(CreateChatLoadedState(myFriends: friends));
    });
    on<CreateChatCreateEvent>((event, emit) async {
      emit(CreateChatLoadingState());
      final user1 = FirebaseAuth.instance.currentUser;
      if (user1 != null) {
        final check = await ChatService.checkChat(user1.uid, event.user2);
        if (check == false) {
          FeedBack.showToast(
            complete: false,
            msg: 'У тебя уже есть чат с этим пользователем',
          );
          await event.context.router.pop();
          return;
        }
        final result = await ChatService.createChat(
          user1: user1.uid,
          user2: event.user2,
        );
        if (result == false) {
          FeedBack.showToast(complete: false, msg: 'Чат создать не удалось');
        }
      }
      await event.context.router.pop();
    });
  }
}
