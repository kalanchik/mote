// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileInfo _$ProfileInfoFromJson(Map<String, dynamic> json) => ProfileInfo(
      name: json['name'] as String,
      age: json['age'] as int,
      photos:
          (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
      mainPhoto: json['mainPhoto'] as String,
      sign: json['sign'] as String,
      education: json['education'] as String,
      work: json['work'] as String,
      interests:
          (json['interests'] as List<dynamic>).map((e) => e as String).toList(),
      moteRating: json['moteRating'] as Map<String, dynamic>,
      additionalInfo: (json['additionalInfo'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(int.parse(k), e as String),
      ),
      desc: json['desc'] as String,
    );

Map<String, dynamic> _$ProfileInfoToJson(ProfileInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'photos': instance.photos,
      'mainPhoto': instance.mainPhoto,
      'desc': instance.desc,
      'moteRating': instance.moteRating,
      'sign': instance.sign,
      'education': instance.education,
      'work': instance.work,
      'interests': instance.interests,
      'additionalInfo':
          instance.additionalInfo.map((k, e) => MapEntry(k.toString(), e)),
    };
