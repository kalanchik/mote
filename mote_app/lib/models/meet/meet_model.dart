import 'package:json_annotation/json_annotation.dart';
import 'package:mote_app/models/user/user_info.dart';

@JsonSerializable()
class MeetModel {
  MeetModel({
    required this.id,
    required this.name,
    required this.desc,
    required this.lat,
    required this.long,
    required this.maxMembers,
    required this.meetDate,
    required this.meetTime,
    required this.users,
    required this.creator,
    required this.meetPhoto,
  });

  final String id;
  final String name;
  final String desc;
  final double lat;
  final double long;
  final int maxMembers;
  final DateTime meetDate;
  final String meetTime;
  final List<Map<String, dynamic>> users;
  final MoteUserInfo creator;
  final String meetPhoto;

  factory MeetModel.fromJson(Map<String, dynamic> json) => MeetModel(
        id: json['id'] as String,
        name: json['name'] as String,
        desc: json['desc'] as String,
        lat: (json['lat'] as num).toDouble(),
        long: (json['long'] as num).toDouble(),
        maxMembers: json['maxMembers'] as int,
        meetDate: DateTime.parse(json['meetDate'] as String),
        meetTime: json['meetTime'] as String,
        users: (json['users'] as List<dynamic>)
            .map((e) => e as Map<String, dynamic>)
            .toList(),
        creator: MoteUserInfo.fromJson(json['creator'] as Map<String, dynamic>),
        meetPhoto: json['meetPhoto'] as String,
      );

  Map<String, dynamic> toJson() => _$MeetModelToJson(this);

  Map<String, dynamic> _$MeetModelToJson(MeetModel instance) =>
      <String, dynamic>{
        'id': instance.id,
        'name': instance.name,
        'desc': instance.desc,
        'lat': instance.lat,
        'long': instance.long,
        'maxMembers': instance.maxMembers,
        'meetDate': instance.meetDate,
        'meetTime': instance.meetTime,
        'users': instance.users,
        'creator': instance.creator.toJson(),
        'meetPhoto': instance.meetPhoto,
      };
}
