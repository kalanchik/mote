// Способ сявзи с пользователем
enum ContactMethod { inApp, email, telegram }

// Важность обращения
enum Priority { low, medium, high }

class SupportRequest {
  SupportRequest({
    required this.id,
    required this.name,
    required this.userUid,
    required this.theme,
    required this.subject,
    required this.timestamp,
    required this.priority,
  });

  final String id; // Id заявки
  final String name; // Имя пользователя
  final String userUid;
  final String theme;
  final String subject;
  final DateTime timestamp;
  final Priority priority;
}
