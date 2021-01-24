import 'package:flutter/material.dart';
import 'package:online_team_management/model/User.dart';
import 'package:online_team_management/service/auth_service.dart';

class HomeController with ChangeNotifier {
  Future<User> currentUser() async {
    User user = await AuthService().currentUser();
    return user;
  }

  Future<bool> signOut() async {
    return await AuthService().singOut();
  }
}
