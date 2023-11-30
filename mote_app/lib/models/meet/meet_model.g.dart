// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeetModel _$MeetModelFromJson(Map<String, dynamic> json) => MeetModel(
      id: json['id'] as String,
      name: json['name'] as String,
      desc: json['desc'] as String,
      lat: (json['lat'] as num).toDouble(),
      long: (json['long'] as num).toDouble(),
      maxMembers: json['maxMembers'] as int,
      meetDate: DateTime.parse(json['meetDate'] as String),
      meetTime: json['meetTime'] as String,
      users: (json['users'] as List<dynamic>)
          .map((e) => UserInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      creator: UserInfo.fromJson(json['creator'] as Map<String, dynamic>),
      meetPhoto: json['meetPhoto'] as String,
    );

Map<String, dynamic> _$MeetModelToJson(MeetModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'desc': instance.desc,
      'lat': instance.lat,
      'long': instance.long,
      'maxMembers': instance.maxMembers,
      'meetDate': instance.meetDate.toIso8601String(),
      'meetTime': instance.meetTime,
      'users': instance.users,
      'creator': instance.creator,
      'meetPhoto': instance.meetPhoto,
    };
