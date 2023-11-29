import 'package:dio/dio.dart';
import 'package:mote_app/models/register_data.dart';

abstract class MoteRepo {
  MoteRepo({required this.dio});
  final Dio dio;
  final serverUrl = 'http://127.0.0.1:3000/mote/login';
}

class MoteReg extends MoteRepo {
  MoteReg({required super.dio});
}

class MoteLogin extends MoteRepo {
  MoteLogin({required super.dio});

  Future<dynamic> loginUser({
    required String email,
    required String pass,
  }) async {
    try {
      final login = await dio
          .get('http://62.113.109.56:3000/mote/login', queryParameters: {
        'phone': email,
        'password': pass,
      });
      return login.data;
    } catch (e) {
      return e.toString();
    }
  }
}

class MoteRegister extends MoteRepo {
  MoteRegister({required super.dio});

  Future<dynamic> registerUser({required RegisterData registerData}) async {
    try {
      print(registerData.fromJson());
      final result = await dio.post(
        'http://62.113.109.56:3000/mote/register',
        data: registerData.fromJson(),
      );
      return result;
    } on DioException catch (e) {
      return e.toString();
    }
  }
}
