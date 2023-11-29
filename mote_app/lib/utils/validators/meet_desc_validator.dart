class MeetingDescriptionValidator {
  static String? validate(String? value) {
    if (value == null) return null;
    // Проверка на пустое значение
    if (value.isEmpty) {
      return null; // Описание может быть пустым, поэтому возвращаем null
    }

    // Проверка длины описания (допустимо от 0 до 300 символов)
    if (value.length > 300) {
      return 'Описание встречи не должно превышать 300 символов';
    }

    // Если все проверки пройдены, возвращаем null
    return null;
  }
}
