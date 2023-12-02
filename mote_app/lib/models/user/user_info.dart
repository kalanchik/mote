import 'package:json_annotation/json_annotation.dart';

part 'user_info.g.dart';

@JsonSerializable()
class MoteUserInfo {
  MoteUserInfo({
    required this.uid,
    required this.name,
    required this.mainPhoto,
    required this.age,
  });

  final String uid;
  final String name;
  final String mainPhoto;
  final int age;

  factory MoteUserInfo.fromJson(Map<String, dynamic> json) =>
      _$MoteUserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$MoteUserInfoToJson(this);
}
