import 'package:json_annotation/json_annotation.dart';
import 'package:mote_app/models/user/user_info.dart';

part 'meet_model.g.dart';

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
  final List<UserInfo> users;
  final UserInfo creator;
  final String meetPhoto;

  factory MeetModel.fromJson(Map<String, dynamic> json) =>
      _$MeetModelFromJson(json);

  Map<String, dynamic> toJson() => _$MeetModelToJson(this);
}
