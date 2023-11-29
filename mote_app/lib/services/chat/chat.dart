import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mote_app/services/account_services/account_services.dart';

class ChatService {
  ChatService._();

  static Stream<QuerySnapshot<Map<String, dynamic>>> getMessageStream(
    String chatId,
  ) {
    final db = FirebaseFirestore.instance;

    final stream = db
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('createdAt', descending: false)
        .snapshots();

    return stream;
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getUserChatStream(
    String uid,
  ) {
    final db = FirebaseFirestore.instance;

    final stream = db
        .collection('chats')
        .where(
          'users',
          arrayContains: uid,
        )
        .snapshots();

    return stream;
  }

  static Future<bool> checkChat(String user1, String user2) async {
    final db = FirebaseFirestore.instance;
    final querySnapshot = await db
        .collection('chats')
        .where('users', arrayContainsAny: [user1, user2]).get();
    if (querySnapshot.docs.isEmpty) {
      return true;
    }
    return false;
  }

  static Future<void> setUserChats(String uid, String chatId) async {
    final db = FirebaseFirestore.instance;
    final data = await AccountServices.getUserInfo(keys: ['myChat'], uid: uid);
    if (data.isEmpty) {
      return;
    }
    final myChat = data['myChat'] as List;
    myChat.add(chatId);
    try {
      await db.collection('users').doc(uid).update({'myChat': myChat});
    } catch (e) {}
  }

  static Future<bool> createChat({
    required String user1,
    required String user2,
  }) async {
    final db = FirebaseFirestore.instance;
    try {
      final docRef = await db.collection('chats').add({});
      final chatId = docRef.id;
      await docRef.collection('messages').add({});
      final info = {
        'id': chatId,
        'users': [user1, user2],
        'status': 'active',
        'lastMessage': {
          'message': '',
          'createdAt': DateTime.now(),
        },
      };
      await docRef.set(info);
      await setUserChats(user1, chatId);
      await setUserChats(user2, chatId);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<void> sendMessage({
    required String chatid,
    required Map<String, dynamic> message,
  }) async {
    final collection = FirebaseFirestore.instance
        .collection('chats')
        .doc(chatid)
        .collection('messages');
    // Создание уникального идентификатора
    final docId = collection.doc().id;
    await collection.doc(docId).set(message);
  }

  static Future<void> sendLastMessage({
    required Map<String, dynamic> lastMessage,
    required String chatId,
  }) async {
    final chat = FirebaseFirestore.instance.collection('chats').doc(chatId);
    try {
      await chat.update({
        'lastMessage': lastMessage,
      });
    } catch (e) {
      return;
    }
  }

  static Future<String?> uploadImage({
    required File photo,
    required String fileName,
  }) async {
    final storage = FirebaseStorage.instance.ref(fileName);
    try {
      await storage.putFile(photo);
      final url = await storage.getDownloadURL();
      return url;
    } catch (e) {
      return null;
    }
  }

  static Future<String?> uploadAudio({
    required String filePath,
    required String fileName,
  }) async {
    try {
      var audioFile = File(filePath);

      // Проверяем, существует ли файл
      if (audioFile.existsSync()) {
        // Читаем содержимое файла
        var fileBytes = await audioFile.readAsBytes();

        var storageReference =
            FirebaseStorage.instance.ref().child('audio/$fileName.m4a');

        // Загружаем файл в Firebase Storage
        await storageReference.putData(fileBytes);

        final url = storageReference.getDownloadURL();
        return url;
      } else {
        print('Ошибка: Файл не существует по пути $filePath');
      }
    } catch (e) {
      print('Ошибка загрузки аудиофайла: $e');
    }
    return null;
  }
}
