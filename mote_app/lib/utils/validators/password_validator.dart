import 'dart:math';

class PasswordValidator {
  static String? validate(String? value) {
    if (value == null) return null;
    // Проверка на пустое значение
    if (value.isEmpty) {
      return 'Введите пароль';
    }

    // Проверка на минимальную длину пароля
    if (value.length < 8) {
      return 'Пароль должен содержать минимум 8 символов';
    }

    // Проверка на минимальную длину пароля
    if (value.length > 20) {
      return 'Пароль должен содержать максимум 20 символов';
    }

    // Проверка наличия хотя бы одной цифры
    if (!value.contains(RegExp(r'\d'))) {
      return 'Пароль должен содержать хотя бы одну цифру';
    }

    // Проверка наличия хотя бы одной заглавной буквы
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Пароль должен содержать хотя бы одну заглавную букву';
    }

    // Проверка наличия хотя бы одного специального символа
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>/_+=]'))) {
      return 'Пароль должен содержать хотя бы один специальный символ';
    }

    // Если все проверки пройдены, возвращаем null
    return null;
  }
}

String generatePassword() {
  final random = Random.secure();
  final length = 12;
  final specialChars = '!@#%^&*()_-+=<>?/';

  String generateRandomChar(String charSet) {
    var charIndex = random.nextInt(charSet.length);
    return charSet[charIndex];
  }

  var password = '';
  password += generateRandomChar(
      'abcdefghijklmnopqrstuvwxyz'); // Минимально одна маленькая буква
  password += generateRandomChar(
      'ABCDEFGHIJKLMNOPQRSTUVWXYZ'); // Минимально одна большая буква
  password += generateRandomChar('0123456789'); // Минимально одна цифра
  password +=
      generateRandomChar(specialChars); // Минимум один специальный символ

  // Добавляем остальные символы
  for (var i = 0; i < length - 4; i++) {
    password += generateRandomChar(
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789$specialChars');
  }

  // Перемешиваем символы пароля
  var passwordCharacters = password.split('');
  passwordCharacters.shuffle();
  password = passwordCharacters.join('');

  return password;
}
