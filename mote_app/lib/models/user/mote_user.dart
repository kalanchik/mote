import 'package:json_annotation/json_annotation.dart';

part 'mote_user.g.dart';

@JsonSerializable()
class MoteUser {
  MoteUser({
    required this.uid,
    required this.userName,
    required this.email,
    required this.pass,
    required this.phone,
    required this.name,
    required this.mainPhoto,
    required this.location,
    required this.gender,
    required this.news,
    required this.myDate,
    required this.myChat,
    required this.myAnonChat,
    required this.myMeet,
    required this.myFriends,
    required this.profileInfo,
    required this.appSettings,
    required this.findSettings,
    required this.motePass,
    required this.myLikes,
    required this.myMatch,
    required this.viewsCount,
    required this.likesCount,
    required this.myDateInvite,
  });
  // Уникальный номер
  final String uid;
  // Ник
  final String userName;
  // Почта
  final String email;
  // Пароль
  final String pass;
  // Телефон
  final String phone;
  // Имя
  final String name;
  // Основное фото
  final String mainPhoto;
  // Место положение
  final Map<String, double> location;
  // Пол
  final String gender;
  // Список новостей
  final List<Map<String, dynamic>> news;
  // Мои Свидания
  final List<String> myDate;
  // Мои чаты
  final List<String> myChat;
  // Мои анонимные чаты
  final List<String> myAnonChat;
  // Мои встречи
  final List<String> myMeet;
  // Мои друзья
  final List<String> myFriends;

  final List<Map<String, dynamic>> myLikes;

  final List<Map<String, dynamic>> myMatch;

  final Map<String, dynamic> profileInfo;

  // Приглашения на свидания
  final List myDateInvite;

  // Количество просмотров анкеты
  final int viewsCount;

  // Количество лайков анкеты
  final int likesCount;

  // Настройки пользователя
  final Map<String, dynamic> appSettings;
  // Параметры поиска для анкет
  final Map<String, dynamic> findSettings;

  // Информация о подписке
  final Map<String, dynamic> motePass;

  factory MoteUser.fromJson(Map<String, dynamic> json) =>
      _$MoteUserFromJson(json);

  Map<String, dynamic> toJson() => _$MoteUserToJson(this);
}
