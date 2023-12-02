// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoteUserInfo _$MoteUserInfoFromJson(Map<String, dynamic> json) => MoteUserInfo(
      uid: json['uid'] as String,
      name: json['name'] as String,
      mainPhoto: json['mainPhoto'] as String,
      age: json['age'] as int,
    );

Map<String, dynamic> _$MoteUserInfoToJson(MoteUserInfo instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'mainPhoto': instance.mainPhoto,
      'age': instance.age,
    };
