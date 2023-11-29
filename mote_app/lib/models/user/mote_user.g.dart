// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mote_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoteUser _$MoteUserFromJson(Map<String, dynamic> json) => MoteUser(
      uid: json['uid'] as String,
      userName: json['userName'] as String,
      email: json['email'] as String,
      pass: json['pass'] as String,
      phone: json['phone'] as String,
      name: json['name'] as String,
      mainPhoto: json['mainPhoto'] as String,
      location: (json['location'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      gender: json['gender'] as String,
      news: (json['news'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      myDate:
          (json['myDate'] as List<dynamic>).map((e) => e as String).toList(),
      myChat:
          (json['myChat'] as List<dynamic>).map((e) => e as String).toList(),
      myAnonChat: (json['myAnonChat'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      myMeet:
          (json['myMeet'] as List<dynamic>).map((e) => e as String).toList(),
      myFriends:
          (json['myFriends'] as List<dynamic>).map((e) => e as String).toList(),
      profileInfo: json['profileInfo'] as Map<String, dynamic>,
      appSettings: json['appSettings'] as Map<String, dynamic>,
      findSettings: json['findSettings'] as Map<String, dynamic>,
      motePass: json['motePass'] as Map<String, dynamic>,
      myLikes: (json['myLikes'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      myMatch: (json['myMatch'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      viewsCount: json['viewsCount'] as int,
      likesCount: json['likesCount'] as int,
      myDateInvite: json['myDateInvite'] as List<dynamic>,
    );

Map<String, dynamic> _$MoteUserToJson(MoteUser instance) => <String, dynamic>{
      'uid': instance.uid,
      'userName': instance.userName,
      'email': instance.email,
      'pass': instance.pass,
      'phone': instance.phone,
      'name': instance.name,
      'mainPhoto': instance.mainPhoto,
      'location': instance.location,
      'gender': instance.gender,
      'news': instance.news,
      'myDate': instance.myDate,
      'myChat': instance.myChat,
      'myAnonChat': instance.myAnonChat,
      'myMeet': instance.myMeet,
      'myFriends': instance.myFriends,
      'myLikes': instance.myLikes,
      'myMatch': instance.myMatch,
      'profileInfo': instance.profileInfo,
      'myDateInvite': instance.myDateInvite,
      'viewsCount': instance.viewsCount,
      'likesCount': instance.likesCount,
      'appSettings': instance.appSettings,
      'findSettings': instance.findSettings,
      'motePass': instance.motePass,
    };
