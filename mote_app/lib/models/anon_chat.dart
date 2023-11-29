import 'package:mote_app/models/chat_model.dart';
import 'package:mote_app/models/mote_models/date.dart';

// Пол пользователя для чатов и не только
enum Gender { male, female, any, hidden }

// Статусы для анонимного  чата
enum AnonChatStatus { searching, chattings, closed }

class AnonChat implements Chat {
  AnonChat({
    required this.id,
    required this.theme,
    required this.creatorGender,
    required this.partnerGender,
    required this.ageRange,
    required this.user1Uid,
    this.description = '',
    this.status = AnonChatStatus.searching,
    this.user2Uid,
    this.creatorAge,
  });

  final String id; // Идентефикатор чата
  final String theme; // Тема чата

  final Gender creatorGender; // Пол создателя
  final Gender partnerGender; // Пол собеседника

  final AgeRange ageRange; // Диапозон возраста для собеседника

  int? creatorAge; // Возраст создателя, который может быть скрыт

  String description; // Описание

  final String user1Uid; // id создателя
  String? user2Uid; // id присоединившегося

  AnonChatStatus status; // Статус чата

  @override
  void setUser2() {}

  @override
  void changeStatus() {}

  @override
  void closeChat() {}

  @override
  void sendMessage() {}
}
