import 'package:flutter/material.dart';
import 'package:online_team_management/util/extension.dart';
import 'package:online_team_management/view/home_view/widget/home_card.dart';
import 'package:online_team_management/view/login_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
                height: 160,
                width: 120,
                child: HomeCard(colors: [
                  Color(0xFF9EA8FB),
                  Color(0xFF3F51EB),
                ], icon: Icons.home, title: "Home")),
            FlatButton(
                child: Text(
                  "Exit",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: context.dynamicWidth(0.035)),
                ),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginView()));
                }),
          ],
        ),
      ),
    );
  }
}
