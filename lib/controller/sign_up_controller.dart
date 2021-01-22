import 'package:firebase_auth/firebase_auth.dart';
import 'package:online_team_management/model/User.dart';
import 'package:online_team_management/service/auth_service.dart';
import 'package:online_team_management/service/user_service.dart';

class SignUp {
  String firstName;
  String lastName;

  String email;
  String password;
  String confirmPassword;

  bool isValid() {
    if (password.length > 6 && password == confirmPassword) {
      return true;
    }
    return false;
  }

  Future<bool> signUp() async {
    AuthResult result =
        await AuthService().signUp(email: email, password: password);

    if (result != null) {
      User user = new User(
          firstName: firstName,
          lastName: lastName,
          email: email,
          isPremium: false,
          membership: [],
          userId: result.user.uid);
      return UserService().saveUser(user);
    }
    return false;
  }
}
