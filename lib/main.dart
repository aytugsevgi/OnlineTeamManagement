import 'package:flutter/material.dart';
import 'package:online_team_management/theme/theme.dart';
import 'package:online_team_management/view/auth_view/login_view.dart';
import 'package:online_team_management/view/home_view/home_view.dart';
<<<<<<< Updated upstream

main() {
=======
import 'package:online_team_management/view/login_view.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
>>>>>>> Stashed changes
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: themeLight,
      home: _checkUserRegistered(),
    );
  }

  _checkUserRegistered() {
    // user zaten login olmuş mu ?
    if (true) {
      return HomeView();
    } else {
      return LoginView();
    }
  }
}
