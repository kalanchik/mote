class EmailValidator {
  EmailValidator._();
  static String? validate(String? value) {
    if (value == null) {
      return null;
    }
    // Проверка на пустое значение
    if (value.isEmpty) {
      return 'Введите адрес электронной почты';
    }

    // Шаблон для проверки адреса электронной почты
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');

    // Проверка соответствия шаблону
    if (!emailRegex.hasMatch(value)) {
      return 'Введите корректный адрес электронной почты';
    }

    // Если все проверки пройдены, возвращаем null
    return null;
  }
}
