import 'package:online_team_management/service/auth_service.dart';

class LoginController {
  String email;
  String password;

  bool isValid() {
    if (password.length >= 6) {
      return true;
    }
    return false;
  }

  Future<bool> login() async {
    return await AuthService().login(email: email, password: password);
  }
}
