import 'package:mote_app/models/mote_user.dart';

class AuthService {
  MoteUser createUser(String uid) {
    return MoteUser(uid: uid);
  }

  // sing in with email && password
  Future<dynamic> signIn({
    required String email,
    required String pass,
  }) async {
    try {} catch (e) {
      return null;
    }
  }
  // register with email && password

  Future<dynamic> registretion({
    required String email,
    required String pass,
  }) async {
    try {} catch (e) {}
  }

  // sing out
  Future<void> signOut() async {}
}
