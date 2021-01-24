import 'package:flutter/material.dart';
import 'package:online_team_management/controller/home_controller.dart';
import 'package:online_team_management/util/extension.dart';
import 'package:online_team_management/view/auth_view/login_view.dart';
import 'package:online_team_management/widget/loading_view.dart';
import 'package:online_team_management/widget/submit_button.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.themeData.buttonColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(flex: 20),
          Expanded(
            flex: 20,
            child: Image.asset(
              "assets/logo2.png",
              fit: BoxFit.contain,
            ),
          ),
          Spacer(flex: 2),
          Expanded(
              flex: 15,
              child: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  "Online Team\nManagement\nTool",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: context.themeData.primaryColorLight,
                      fontSize: context.dynamicWidth(0.07)),
                ),
              )),
          Spacer(flex: 33),
          Expanded(
              flex: 8,
              child: Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: SizedBox(
                  width: context.dynamicWidth(0.4),
                  child: SubmitButton(
                    onTap: () {},
                    colors: [Colors.red, Colors.red],
                    child: Text(
                      "Delete Account",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: context.themeData.primaryColorLight,
                          fontSize: context.dynamicWidth(0.03)),
                    ),
                  ),
                ),
              )),
          Spacer(flex: 2),
          Expanded(
              flex: 8,
              child: Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: SubmitButton(
                  onTap: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoadingView()));
                    bool isSuccess = await Provider.of<HomeController>(context,
                            listen: false)
                        .signOut();
                    Navigator.pop(context);
                    if (isSuccess) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => LoginView()));
                    }
                  },
                  colors: [
                    context.themeData.primaryColorLight,
                    context.themeData.primaryColorLight
                  ],
                  child: Text(
                    "Sign Out",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: context.themeData.primaryColorDark,
                        fontSize: context.dynamicWidth(0.05)),
                  ),
                ),
              )),
          Spacer(flex: 4),
        ],
      ),
    );
  }
}
