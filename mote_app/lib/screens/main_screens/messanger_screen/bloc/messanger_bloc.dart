import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mote_app/models/mote_models/fire_chat.dart';
import 'package:mote_app/services/account_services/account_services.dart';
import 'package:mote_app/services/chat/chat.dart';

part 'messanger_event.dart';
part 'messanger_state.dart';

class MessangerBloc extends Bloc<MessangerEvent, MessangerState> {
  final String uid;
  late final StreamController<MessangerState> _chatController;
  MessangerBloc({required this.uid}) : super(MessangerInitial()) {
    _chatController = StreamController<MessangerState>();

    on<MessageLoadEvent>(_mapLoadChatsToState);
  }

  StreamController<MessangerState> get chatController => _chatController;

  Future<void> _mapLoadChatsToState(
      MessageLoadEvent event, Emitter<MessangerState> emit) async {
    try {
      var chatStream = ChatService.getUserChatStream(uid);
      await for (QuerySnapshot<Map<String, dynamic>> snapshot in chatStream) {
        List<DocumentSnapshot<Map<String, dynamic>>> chatDocs = snapshot.docs;
        final chats = <FireChat>[];
        for (var chatInfo in chatDocs) {
          final chatData = chatInfo.data();
          final users = chatData!['users'] as List;
          final user1 = users[0] as String;
          final user2 = users[1] as String;
          var chat = <String, dynamic>{};
          if (user1 == uid) {
            final chatPhotoAndName = await AccountServices.getUserNameAndPhoto(
              user2,
            );
            chat = {...chatPhotoAndName, ...chatData};
          } else {
            final chatPhotoAndName =
                await AccountServices.getUserNameAndPhoto(user1);
            chat = {...chatPhotoAndName, ...chatData};
          }
          final fireChat = FireChat.fromJson(chat);
          chats.add(fireChat);
        }
        emit(MessangerLoadedState(chats: chats));
      }
    } catch (e) {
      emit(MessangerFailureState(error: e.toString()));
    }
  }

  @override
  Future<void> close() {
    _chatController.close();
    return super.close();
  }
}
