import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  User({
    required this.uid,
    required this.name,
    required this.location,
    required this.gender,
    required this.profileInfo,
    required this.registerInfo,
    required this.myDate,
    required this.myChat,
    required this.myMeet,
    required this.myAnonChat,
    required this.appSettings,
    required this.findSettings,
    required this.motePremium,
    required this.myFriend,
    required this.news,
  });

  // Уникальный id
  final String uid;
  // Имя пользователя
  final String name;

  // Локация пользователя для свиданий и поиска
  Map<String, double> location;

  // Пол пользователя
  final String gender;

  // Список новостей для ленты
  List<Map<String, dynamic>> news = [];

  // Информация об анкете пользователя
  Map<String, dynamic> profileInfo;
  // Информация об регистрационных данных пользователя
  Map<String, dynamic> registerInfo;

  // Список свиданий
  List<String> myDate;
  // Список чатов
  List<String> myChat;
  // Список встреч
  List<String> myMeet;
  // Список анонимных чатов
  List<String> myAnonChat;
  // Список Друзей
  List<String> myFriend;

  // Настройки пользователя
  Map<String, dynamic> appSettings;
  // Параметры поиска для анкет
  Map<String, dynamic> findSettings;

  // Информация о подписке
  Map<String, dynamic> motePremium;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object?> get props => [
        uid,
        name,
        gender,
        location,
        news,
        profileInfo,
        registerInfo,
        myDate,
        myChat,
        myMeet,
        myAnonChat,
        myFriend,
        appSettings,
        findSettings,
        motePremium,
      ];
}

class AppSettings extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class FindSettings extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}
