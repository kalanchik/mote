// Содержит краткую информацию о пользователе, чтобы не перегружать поток данных
// Главное здесь это индификатор, который позволит найти по нему пользователя
class UserInfo {
  UserInfo({
    required this.userUid,
    required this.photo,
    required this.name,
    required this.gender,
    required this.age,
  });

  final String userUid; // Уникальный индификатор

  final String photo; // Ссылка на основное фото пользователя

  final String name; // Имя
  final String gender; // Пол

  final int age; // Возраст
}
