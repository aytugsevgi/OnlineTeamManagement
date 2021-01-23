import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online_team_management/model/User.dart';
import 'package:online_team_management/service/auth_service.dart';
import 'package:online_team_management/service/user_service.dart';

class SignUpController with ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  String firstName;
  String lastName;

  String email;
  String password;
  String confirmPassword;

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

  bool validateSignUp() {
    return formKey.currentState.validate();
  }

  String emailValidator() {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (!emailValid) {
      return "Invalid Email";
    }
    return null;
  }

  String passwordValidator() {
    if (password.length < 6) {
      return "Password must be least at 6 characters";
    }
    return null;
  }

  String firstNameValidator() {
    if (firstName.isEmpty) {
      return "Name can't be empty";
    }
    return null;
  }

  String lastNameValidator() {
    if (lastName.isEmpty) {
      return "Name can't be empty";
    }
    return null;
  }

  String confirmPasswordValidator() {
    if (password != confirmPassword) {
      return "Confirm password and password not matched";
    }
    return null;
  }
}
