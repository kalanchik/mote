// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      uid: json['uid'] as String,
      name: json['name'] as String,
      location: (json['location'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      gender: json['gender'] as String,
      profileInfo: json['profileInfo'] as Map<String, dynamic>,
      registerInfo: json['registerInfo'] as Map<String, dynamic>,
      myDate:
          (json['myDate'] as List<dynamic>).map((e) => e as String).toList(),
      myChat:
          (json['myChat'] as List<dynamic>).map((e) => e as String).toList(),
      myMeet:
          (json['myMeet'] as List<dynamic>).map((e) => e as String).toList(),
      myAnonChat: (json['myAnonChat'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      appSettings: json['appSettings'] as Map<String, dynamic>,
      findSettings: json['findSettings'] as Map<String, dynamic>,
      motePremium: json['motePremium'] as Map<String, dynamic>,
      myFriend:
          (json['myFriend'] as List<dynamic>).map((e) => e as String).toList(),
      news: (json['news'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'location': instance.location,
      'gender': instance.gender,
      'news': instance.news,
      'profileInfo': instance.profileInfo,
      'registerInfo': instance.registerInfo,
      'myDate': instance.myDate,
      'myChat': instance.myChat,
      'myMeet': instance.myMeet,
      'myAnonChat': instance.myAnonChat,
      'myFriend': instance.myFriend,
      'appSettings': instance.appSettings,
      'findSettings': instance.findSettings,
      'motePremium': instance.motePremium,
    };
