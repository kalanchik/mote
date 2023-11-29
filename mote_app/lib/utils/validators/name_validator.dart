class RussianNameValidator {
  static String? validate(String? value) {
    if (value == null) {
      return null;
    }
    // Проверка на пустое значение
    if (value.isEmpty) {
      return 'Введите имя';
    }

    // Регулярное выражение для проверки имени: только буквы и пробелы
    final nameRegex = RegExp(r'^[А-Яа-яЁё\s]+$');

    // Проверка соответствия шаблону
    if (!nameRegex.hasMatch(value)) {
      return 'Введите корректное имя';
    }

    // Если все проверки пройдены, возвращаем null
    return null;
  }
}
