// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => UserInfo(
      uid: json['uid'] as String,
      name: json['name'] as String,
      mainPhoto: json['mainPhoto'] as String,
      age: json['age'] as String,
    );

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'mainPhoto': instance.mainPhoto,
      'age': instance.age,
    };
