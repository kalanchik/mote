import 'package:json_annotation/json_annotation.dart';

part 'profile_info.g.dart';

@JsonSerializable()
class ProfileInfo {
  ProfileInfo({
    required this.name,
    required this.age,
    required this.photos,
    required this.mainPhoto,
    required this.sign,
    required this.education,
    required this.work,
    required this.interests,
    required this.moteRating,
    required this.additionalInfo,
    required this.desc,
  });

  // Имя
  final String name;
  // Возраст
  final int age;

  // Массив с ссылками на фотографии в UserPhotos
  final List<String> photos;

  /// Основная фотография пользователя [photos[0]
  String mainPhoto;

  String desc;

  // Рейтинг пользователя
  final Map moteRating;

  // Знак зодиака
  final String sign;
  // Образование
  String education;
  // Работа
  String work;

  // Массив с интересами
  final List<String> interests;

  // Ответы на вопросы теста
  Map<int, String> additionalInfo;

  factory ProfileInfo.fromJson(Map<String, dynamic> json) =>
      _$ProfileInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileInfoToJson(this);
}
