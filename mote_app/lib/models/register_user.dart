import 'dart:io';

import 'package:flutter/material.dart';

class RegisterUser {
  String? _name;
  String? _password;
  String? _phoneNumber;
  String? _email;
  String? _age;
  String? _male;
  String? _sign;
  String? _desc;
  List<String>? _interests;
  String? _findGender;
  bool _imageUpload = false;
  bool _descUpload = false;
  final List<File?> _usersImages = [null, null, null, null, null, null];

  String getSign() {
    return _sign!;
  }

  String getFindGender() {
    return _findGender!;
  }

  String getUserInfo({required String param}) {
    final userInfo = <String, String?>{
      'name': _name,
      'male': _male,
      'age': _age,
      'sign': _sign,
      'findGender': _findGender,
    };
    return userInfo[param] ?? 'Error';
  }

  List<File?> getUserImages() {
    return _usersImages;
  }

  void userUploadImage(bool value) {
    _imageUpload = value;
  }

  bool getImageUpload() {
    return _imageUpload;
  }

  List<FileImage> getUserImageTest() {
    var userFileImages = <FileImage>[];
    for (var file in _usersImages) {
      if (file != null) {
        userFileImages.add(FileImage(file));
      }
    }
    return userFileImages;
  }

  void setUserInterests({required List<String> interests}) {
    _interests = interests;
  }

  void setUserSign({required String sign}) {
    _sign = sign;
  }

  List<String> getUserInterest() {
    return _interests ?? [];
  }

  void setFindGender({required String gender}) {
    _findGender = gender;
  }

  String getUserName() {
    return _name ?? 'Error';
  }

  String getUserAge() {
    return _age ?? 'Error';
  }

  void setDesc(String desc) {
    _desc = desc;
    _descUpload = true;
  }

  String getDesc() {
    if (_desc != null) {
      return _desc!;
    }
    return 'Error';
  }

  bool isUploadDesc() {
    return _descUpload;
  }

  void registerUser({
    required String name,
    required String age,
    required String male,
    required String pass,
    required String emial,
  }) {
    _name = name;
    _age = age;
    _male = male;
    _password = pass;
    _email = emial;
  }

  void createProfile() {
    // TODO: Send user info to the server
    final Map userInfo = {
      'name': _name,
      'password': _password,
      'phone': _phoneNumber,
      'email': _email,
      'age': _age,
      'male': _male,
      'sign': _sign,
      'desc': _desc,
      'interest': _interests,
      'findGender': _findGender,
    };
    userInfo;
  }
}
