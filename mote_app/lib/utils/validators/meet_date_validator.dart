import 'package:intl/intl.dart';

class MeetingDateValidator {
  static String? validate(String? value) {
    if (value == null) return null;
    if (value.isEmpty) {
      return 'Введите дату встречи';
    }

    try {
      // Пробуем распарсить введенную дату
      var selectedDate = DateFormat('dd.MM.yyyy').parseStrict(value);

      // Проверка, что выбранная дата не прошедшая
      if (selectedDate.isBefore(DateTime.now())) {
        return 'Выберите дату встречи, не прошедшую';
      }

      // Проверка, что выбранная дата не дальше чем месяц от текущей даты
      var maxDate = DateTime.now().add(const Duration(days: 30));
      if (selectedDate.isAfter(maxDate)) {
        return 'Выберите дату встречи не дальше чем через месяц от текущей даты';
      }
    } catch (e) {
      return 'Введите корректную дату в формате ДД.ММ.ГГГГ';
    }

    return null;
  }
}
