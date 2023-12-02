import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mote_app/models/user/profile_info.dart';

class AccountServices {
  final _db = FirebaseFirestore.instance;
  // Получить пользователя

  Future<Map<String, dynamic>?> getNewsInfo() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final snapshot = await _db.collection('users').doc(user.uid).get();
      if (snapshot.exists) {
        final userData = snapshot.data()!;
        final info = userData['profileInfo'] as Map<String, dynamic>;
        return {
          'name': info['name'] as String,
          'mainPhoto': info['mainPhoto'] as String,
          'news': userData['news'] as List,
        };
      }
    }
    return null;
  }

  // Получить информацию из profileInfo по заданным ключам
  static Future<Map<String, dynamic>?> getInfoFromProfile(
    String uid,
    List<String> keys,
  ) async {
    final data = await getUserInfo(keys: ['profileInfo'], uid: uid);
    final profileInfo = data['profileInfo'] as Map<String, dynamic>;
    final info = <String, dynamic>{
      'uid': uid,
    };
    if (data.isEmpty) {
      return null;
    }
    for (var key in keys) {
      if (profileInfo.containsKey(key)) {
        info[key] = profileInfo[key];
      }
    }
    return info;
  }

  static Future<Map<String, String>> getUserNameAndPhoto(String uid) async {
    final data = await getUserInfo(keys: ['name', 'profileInfo'], uid: uid);
    if (data.isEmpty) {
      return {};
    }
    final name = data['name'] as String;
    final mainPhoto =
        (data['profileInfo'] as Map<String, dynamic>)['mainPhoto'] as String;
    final info = {
      'name': name,
      'mainPhoto': mainPhoto,
    };
    return info;
  }

  // Получить информацию с пользователя
  static Future<Map<String, dynamic>> getUserInfo({
    required List<String> keys,
    required String uid,
  }) async {
    try {
      final db = FirebaseFirestore.instance;
      // получаем информацию о пользователе
      final userSnapshot = await db.collection('users').doc(uid).get();
      // Если документ открывается
      if (userSnapshot.exists) {
        // получаем информацию
        final userData = userSnapshot.data()!;
        final filteredUserData = <String, dynamic>{};
        for (var key in keys) {
          // Если в дате есть ключ, то помещаем его в новую мапу
          if (userData.containsKey(key)) {
            filteredUserData[key] = userData[key];
          }
        }
        return filteredUserData;
      }
      return {};
    } catch (e) {
      return {};
    }
  }

  static Future<ProfileInfo?> getProfileInfo() async {
    // Получаем пользователя
    final user = FirebaseAuth.instance.currentUser;

    // Проверяем активен ли пользователь
    if (user != null) {
      // Получаем мапу
      final profileInfo = await getUserInfo(
        keys: ['profileInfo'],
        uid: user.uid,
      );
      // Если она не пустая, то все ок
      if (profileInfo.isNotEmpty) {
        // Мамип в профиль
        return ProfileInfo.fromJson(profileInfo['profileInfo']);
      }
      return null;
    }
    return null;
  }

  static Future<bool> updateUser({
    required String key,
    required Map<String, dynamic> newData,
    required String uid,
  }) async {
    final db = FirebaseFirestore.instance;
    try {
      await db
          .collection('users')
          .doc(uid)
          .set({key: newData}, SetOptions(merge: true));
      return true;
    } catch (e) {
      return false;
    }
  }

  // Обновить блок обо мне
  static Future<bool?> updateAboutMe({
    required String desc,
    required String work,
    required String education,
  }) async {
    final user = FirebaseAuth.instance.currentUser;
    // Получаем старый профайл инфо
    if (user == null) {
      return false;
    }
    final data = await getUserInfo(keys: ['profileInfo'], uid: user.uid);
    if (data.isEmpty) {
      return false;
    }
    final profileInfo = ProfileInfo.fromJson(data['profileInfo']);
    // Заменяем параметры
    if (desc.isNotEmpty) {
      profileInfo.desc = desc;
    }
    if (education.isNotEmpty) {
      profileInfo.education = education;
    }
    if (work.isNotEmpty) {
      profileInfo.work = work;
    }
    final result = await updateUser(
      key: 'profileInfo',
      newData: profileInfo.toJson(),
      uid: user.uid,
    );
    if (result == true) {
      return true;
    }
    return false;
  }

  static Future<bool> saveAdditionalInfo({
    required Map<int, String> info,
  }) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return false;
    }

    final data = await getUserInfo(keys: ['profileInfo'], uid: user.uid);
    if (data.isEmpty) {
      return false;
    }

    final profileInfo = ProfileInfo.fromJson(data['profileInfo']);
    // устанавливаем новое значение
    profileInfo.additionalInfo = info;

    final result = await updateUser(
      key: 'profileInfo',
      newData: profileInfo.toJson(),
      uid: user.uid,
    );
    if (result) {
      return result;
    }
    return result;
  }

  // Получить инофрмацию о пользователе
  Future<void> getUserProfile() async {}
}
