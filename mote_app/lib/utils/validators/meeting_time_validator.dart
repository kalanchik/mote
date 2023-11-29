import 'package:intl/intl.dart';

class MeetingTimeValidator {
  static String? validate(String? value) {
    if (value == null) return null;
    if (value.isEmpty) {
      return 'Введите время встречи';
    }

    try {
      // Пробуем распарсить введенное время
      var timeFormat = DateFormat('HH:mm');
      var selectedTime = timeFormat.parseStrict(value);
    } catch (e) {
      return 'Введите корректное время в формате ЧЧ:мм';
    }

    return null;
  }
}
