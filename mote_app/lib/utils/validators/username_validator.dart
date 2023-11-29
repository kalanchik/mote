class UsernameValidator {
  static String? validate(String? value) {
    if (value == null) return null;
    // Проверка на пустое значение
    if (value.isEmpty) {
      return 'Введите имя пользователя';
    }

    // Регулярное выражение для проверки имени пользователя:
    // только английские буквы, цифры и знак "_", длина от 6 до 12 символов
    final usernameRegex = RegExp(r'^[a-zA-Z0-9_@]{6,12}$');

    // Проверка соответствия шаблону
    if (!usernameRegex.hasMatch(value)) {
      return 'Имя пользователя должно содержать только английские буквы, цифры и знак "_" и быть от 6 до 12 символов в длину';
    }

    // Если все проверки пройдены, возвращаем null
    return null;
  }
}
