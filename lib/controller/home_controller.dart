import 'package:flutter/material.dart';
import 'package:online_team_management/service/auth_service.dart';

class HomeController with ChangeNotifier {
  Future<bool> signOut() async {
    return await AuthService().singOut();
  }
}
