import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online_team_management/model/User.dart';
import 'package:online_team_management/service/auth_service.dart';

class LoginController with ChangeNotifier {
  GlobalKey<FormState> formKey;
  String email = "";
  String password = "";

  Future<bool> login() async {
    if (isLoginValidate()) {
      bool result = await AuthService().login(email: email, password: password);
      if (result) {
        // giriş işlemi başarılı
        return true;
      }
      // giriş işlemi başarısız - firebase tarafından başarısız
      print("DEBUG: Firebase tarafından başarısız");
      return false;
    }
    print("DEBUG: Code tarafından başarısız");
    // giriş işlemi başarısız - source code tarafından başarısız
    return false;
  }

  Future<bool> isAlreadyLogin() async {
    User user = await AuthService().currentUser();
    if (user != null) {
      return true;
    }
    return false;
  }

  String validateEmail() {
    if (email.isEmpty) {
      return "Email can not be empty";
    }
    return null;
  }

  String validatePassword() {
    if (password.length < 6) {
      return "Password must be least 6 characters";
    }
    return null;
  }

  bool isLoginValidate() {
    return formKey.currentState.validate();
  }
}
