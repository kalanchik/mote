import 'dart:io';
import 'dart:math';

import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class EmailVerification {
  static int generateCode() {
    // Генерация случайного кода из 6 цифр
    var random = Random();
    var code = random.nextInt(900000) + 100000;

    return code;
  }

  static Future<void> sendMessage({
    required String email,
    required int code,
  }) async {
    try {
      final username = 'mote.ru.rf@gmail.com';
      final password = 'xbps wupa zveq dlsg';
      final message = Message();
      message.from = Address(username, 'Mote');
      message.recipients.add(email);
      message.subject = 'Подтверждение аккаунта';
      message.text = 'Привет как дела?';
      message.html = '''
 <div style="width: 100%; max-width: 600px; margin: 0 auto; background-color: #ccc; padding: 20px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); border-radius: 8px; margin-top: 20px; text-align: center;">

        <div style="font-size: 24px; font-weight: bold; color: #333; margin-bottom: 20px;">$code</div>

        <div style="color: #666;">Введите этот код для подтверждения вашего аккаунта.</div>

        <div style="font-size: 36px; font-weight: bold; color: red; margin-top: 20px;">mote</div>

    </div>''';
      final smtpServver = gmail(username, password);
      await send(message, smtpServver);

      print('Письмо отправлено');
    } on MailerException catch (e) {
      print('Ошибка отправки письма: $e');
    } on SocketException catch (e) {
      print('Ошибка подключения: $e');
    }
  }
}
