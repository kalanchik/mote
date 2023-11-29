class RussianPhoneNumberValidator {
  RussianPhoneNumberValidator._();
  static String? validate(String? value) {
    if (value == null) {
      return null;
    }
    // Удаляем все нецифровые символы из номера телефона
    var cleanedPhoneNumber = value.replaceAll(RegExp(r'\D'), '');

    // Проверка на пустой номер
    if (cleanedPhoneNumber.isEmpty) {
      return 'Введите номер телефона';
    }

    // Проверка на длину номера (обычно в России 10 цифр после +7)
    if (cleanedPhoneNumber.length != 11) {
      return 'Некорректная длина номера телефона';
    }

    // Проверка на принадлежность к российскому коду (допустимые коды: +7)
    if (!cleanedPhoneNumber.startsWith('7')) {
      return 'Некорректный код страны в номере телефона';
    }

    // Если все проверки пройдены, возвращаем null
    return null;
  }
}
