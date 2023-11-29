import 'dart:async';

import 'package:chatview/chatview.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mote_app/models/mote_models/fire_chat_users.dart';
import 'package:mote_app/models/mote_models/fire_message.dart';
import 'package:mote_app/services/account_services/account_services.dart';
import 'package:mote_app/services/chat/chat.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final String chatid;
  final ScrollController scrollController = ScrollController();
  late final StreamController<ChatState> _streamController;
  final List<FireMessage> _fireMessages = [];
  ChatBloc({required this.chatid}) : super(ChatInitial()) {
    _streamController = StreamController<ChatState>();
    on<ChatLoading>((event, emit) async {
      try {
        final user = FirebaseAuth.instance.currentUser;

        final currentUser = user!.uid;

        final user2 =
            event.users[0] == user.uid ? event.users[1] : event.users[0];
        final fireChatUsers = await getUserInfo(currentUser, user2);

        final chatController = _creteChatController(fireChatUsers);

        var chatStream = ChatService.getMessageStream(event.chatId);
        await for (QuerySnapshot<Map<String, dynamic>> snapshot in chatStream) {
          List<DocumentSnapshot<Map<String, dynamic>>> chatDocs = snapshot.docs;

          final allMessages = <FireMessage>[];

          for (var element in chatDocs) {
            final data = element.data();
            if (data!.isNotEmpty) {
              final fireMessage = FireMessage.fromJson(data);
              allMessages.add(fireMessage);
            }
          }
          final toSend = <FireMessage>[];
          for (var message in allMessages) {
            final check = _checkMessage(message.id);
            if (check) {
              toSend.add(message);
              _fireMessages.add(message);
              chatController.addMessage(_convertFireToMessage(message));
            }
          }
          emit(ChatLoaded(
            chatController: chatController,
            fireChatUsers: fireChatUsers,
          ));
        }
      } catch (e) {
        print(e);
      }
    });
  }

  bool _checkMessage(String id) {
    for (var message in _fireMessages) {
      if (message.id == id) {
        return false;
      }
    }
    return true;
  }

  ChatController _creteChatController(
    FireChatUsers users,
  ) {
    return ChatController(
      initialMessageList: [],
      scrollController: scrollController,
      chatUsers: [
        ChatUser(
          id: users.currentUserId,
          name: users.currentUserName,
          profilePhoto: users.currentUserPhoto,
        ),
        ChatUser(
          id: users.user2Id,
          name: users.user2Name,
          profilePhoto: users.user2Photo,
        ),
      ],
    );
  }

  Message _convertFireToMessage(FireMessage message) {
    return Message(
      id: message.id,
      message: message.message,
      createdAt: message.createdAt,
      sendBy: message.sendBy,
      replyMessage: ReplyMessage(
        messageId: message.replyMessage.messageId,
        message: message.replyMessage.message,
        replyTo: message.replyMessage.replyTo,
        replyBy: message.replyMessage.replyBy,
        messageType: message.replyMessage.messageType,
        voiceMessageDuration: message.replyMessage.voiceMessageDuration,
      ),
      reaction: Reaction(
        reactions: message.reaction.reactions,
        reactedUserIds: message.reaction.reactedUserIds,
      ),
      messageType: message.messageType,
      voiceMessageDuration: message.voiceMessageDuration,
    );
  }

  Future<FireChatUsers> getUserInfo(String currentUser, String user2) async {
    final user1Info = await AccountServices.getUserNameAndPhoto(currentUser);
    final user2Info = await AccountServices.getUserNameAndPhoto(user2);
    return FireChatUsers.fromJson({
      'currentUserId': currentUser,
      'currentUserName': user1Info['name'],
      'currentUserPhoto': user1Info['mainPhoto'],
      'user2Id': user2,
      'user2Name': user2Info['name'],
      'user2Photo': user2Info['mainPhoto'],
    });
  }

  StreamController<ChatState> get chatController => _streamController;

  @override
  Future<void> close() {
    chatController.close();
    _streamController.close();
    return super.close();
  }
}
