import 'package:flutter/material.dart';
import 'package:online_team_management/controller/home_controller.dart';
import 'package:online_team_management/controller/login_controller.dart';
import 'package:online_team_management/controller/sign_up_controller.dart';
import 'package:online_team_management/theme/theme.dart';
import 'package:online_team_management/view/auth_view/login_view.dart';
import 'package:online_team_management/view/home_view/home_view.dart';
import "package:provider/provider.dart";

main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => LoginController()),
      ChangeNotifierProvider(create: (context) => SignUpController()),
      ChangeNotifierProvider(create: (context) => HomeController()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: themeLight,
      home: FutureBuilder(
          future: _checkUserRegistered(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return snapshot.data;
              }
              return _errorView;
            }
            return Container(
                color: Colors.white,
                child: Center(child: CircularProgressIndicator()));
          }),
    );
  }

  Future<Widget> _checkUserRegistered() async {
    // user zaten login olmuş mu ?

    bool isAlreadyLogin = await LoginController().isAlreadyLogin();
    print(isAlreadyLogin);
    if (isAlreadyLogin) {
      return HomeView();
    }
    return LoginView();
  }

  Widget get _errorView =>
      Material(child: Center(child: Text("Beklenmedik bir hata oluştu.")));
}
