class PasswordConfirmationValidator {
  static String? validate(String password, String confirmPassword) {
    // Проверка на пустые значения
    if (password.isEmpty || confirmPassword.isEmpty) {
      return 'Введите пароль и подтверждение пароля';
    }

    // Проверка соответствия пароля и подтверждения пароля
    if (password != confirmPassword) {
      return 'Пароль и подтверждение пароля должны совпадать';
    }

    // Если все проверки пройдены, возвращаем null
    return null;
  }
}
