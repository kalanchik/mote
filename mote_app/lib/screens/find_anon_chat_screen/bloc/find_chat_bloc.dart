import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mote_app/models/anon_chat_model.dart';
import 'package:mote_app/models/test_users.dart';

part 'find_chat_event.dart';
part 'find_chat_state.dart';

class FindChatBloc extends Bloc<FindChatEvent, FindChatState> {
  FindChatBloc() : super(FindChatInitial()) {
    on<FindChatLoadChatsEvent>((event, emit) async {
      // Загружаем данные о чатах с сервера
      await Future.delayed(const Duration(seconds: 2));
      emit(FindChatLoaded(chatsList: TestUsers.findAnonChatsList));
    });
    on<FindChatJoinChatEvent>((event, emit) async {
      emit(FindChatJoinChat(chatId: event.anonChat.chatId));
      event.anonChat.activatedChat(newUser: TestUsers.anna);
      TestUsers.anonChats.add(event.anonChat);
      await Future.delayed(const Duration(seconds: 2));
      // Показываем пользователю, что он успешно вступил в чат
      emit(FindChatJoinChatComplete(anonChat: event.anonChat));
    });
  }
}
