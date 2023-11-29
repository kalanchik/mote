class RegisterData {
  final String _name;
  final String _pass;
  final String _phone;
  final String _email;
  final int _age;
  final String _gender;

  RegisterData({
    required String name,
    required String pass,
    required String phone,
    required String email,
    required int age,
    required String gender,
  })  : _name = name,
        _pass = pass,
        _phone = phone,
        _email = email,
        _age = age,
        _gender = gender;

  Map<String, dynamic> fromJson() {
    return {
      'name': _name,
      'password': _pass,
      'phone': _phone,
      'email': _email,
      'age': _age,
      'gender': _gender,
    };
  }
}
