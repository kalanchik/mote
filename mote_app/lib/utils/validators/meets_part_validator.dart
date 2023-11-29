class MeetingParticipantsValidator {
  static String? validate(String? value) {
    if (value == null) return null;
    // Проверка на пустое значение
    if (value.isEmpty) {
      return 'Введите количество участников';
    }

    // Преобразование введенной строки в число
    try {
      var participants = int.parse(value);

      // Проверка на допустимый диапазон участников (от 3 до 50)
      if (participants < 3 || participants > 50) {
        return 'Количество участников должно быть от 3 до 50';
      }
    } catch (e) {
      // Если не удалось преобразовать введенное значение в число
      return 'Введите корректное количество участников';
    }

    // Если все проверки пройдены, возвращаем null
    return null;
  }
}
