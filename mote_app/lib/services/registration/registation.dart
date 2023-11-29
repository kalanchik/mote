import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mote_app/models/user/mote_user.dart';
import 'package:mote_app/models/user/profile_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  AuthService._();

  static Future<dynamic> setProfileInfo({
    required Map<String, dynamic> profileInfo,
  }) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final db = FirebaseFirestore.instance;
    await db
        .collection('users')
        .doc(uid)
        .set({'profileInfo': profileInfo}, SetOptions(merge: true));
  }

  static Future<dynamic> uploadImage({
    required File photo,
    required int photoNumber,
  }) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final storage = FirebaseStorage.instance.ref('$uid($photoNumber)');
    try {
      await storage.putFile(photo);
      final url = await storage.getDownloadURL();
      return url;
    } catch (e) {
      return false;
    }
  }

  static Future<Map<String, dynamic>> getNameAndAge() async {
    final user = FirebaseAuth.instance.currentUser;
    final db = FirebaseFirestore.instance;
    late final String name;
    late final int age;
    await db.collection('users').doc(user!.uid).get().then((value) {
      name = value['profileInfo']['name'];
      age = value['profileInfo']['age'] as int;
    });
    return {
      'name': name,
      'age': age,
    };
  }

  static Future<dynamic> registerUser({
    required String name,
    required String nickName,
    required String phone,
    required int age,
    required String gender,
    required String password,
    required String email,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final currentUser = FirebaseAuth.instance.currentUser;
      final profileInfo = ProfileInfo(
        name: name,
        age: age,
        photos: [],
        mainPhoto: '',
        sign: '',
        education: '',
        work: '',
        interests: [],
        moteRating: {},
        additionalInfo: {},
        desc: '',
      );
      final moteUser = MoteUser(
        uid: currentUser!.uid,
        userName: nickName,
        email: email,
        phone: phone,
        name: name,
        profileInfo: profileInfo.toJson(),
        mainPhoto: '',
        location: {},
        pass: password,
        gender: gender,
        news: [],
        myDate: [],
        myDateInvite: [],
        myChat: [],
        myAnonChat: [],
        myMeet: [],
        myFriends: [],
        appSettings: {},
        findSettings: {},
        motePass: {},
        myLikes: [],
        myMatch: [],
        viewsCount: 0,
        likesCount: 0,
      );
      await saveUser(user: moteUser.toJson(), uid: currentUser.uid);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'Предоставленный пароль слишком слабый.';
      } else if (e.code == 'email-already-in-use') {
        return 'Учетная запись для этого адреса электронной почты уже существует.';
      }
    } catch (e) {
      return false;
    }
  }

  static Future<dynamic> saveUser(
      {required Map<String, dynamic> user, required String uid}) async {
    final db = FirebaseFirestore.instance;
    await db.collection('users').doc(uid).set(user);
  }

  static Future<dynamic> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'Для этого email не найден ни один пользователь.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      }
    }
  }

  static Future<dynamic> logOut() async {
    final auth = FirebaseAuth.instance;
    final prefrence = await SharedPreferences.getInstance();

    await prefrence.setBool('isLoggedIn', false);
    await auth.signOut();
    return true;
  }

  static Future<bool> checkLogin() async {
    final preferences = await SharedPreferences.getInstance();
    // Проверяем входил ли раньше пользователь
    var isLogged = preferences.getBool('isLoggedIn') ?? false;

    if (isLogged) {
      return true;
    }
    return false;
  }

  static Future<bool> loginWithSaveData() async {
    final storage = const FlutterSecureStorage();
    // Знаем, что пользователь уже входил, поэтому получаем данные
    var email = await storage.read(key: 'email');
    var password = await storage.read(key: 'password');

    if (email != null && password != null) {
      final auth = FirebaseAuth.instance;
      await auth.signOut();
      await auth.signInWithEmailAndPassword(email: email, password: password);
    }
    return false;
  }

  static Future<void> saveUserData({
    required String email,
    required String password,
  }) async {
    final storage = const FlutterSecureStorage();
    final preference = await SharedPreferences.getInstance();
    await preference.setBool('isLoggedIn', true);
    await storage.write(key: 'email', value: email);
    await storage.write(key: 'password', value: password);
  }
}
