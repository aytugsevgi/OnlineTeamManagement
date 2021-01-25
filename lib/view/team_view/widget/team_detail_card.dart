import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_team_management/theme/theme.dart';
import 'package:online_team_management/util/extension.dart';

class TeamDetailCard extends StatelessWidget {
  final IconData icon;
  final String name;
  final String email;
  final Function onTap;
  const TeamDetailCard({this.icon, this.name, this.email, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
            vertical: context.dynamicHeight(0.02),
            horizontal: context.dynamicWidth(0.04)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            gradient: LinearGradient(colors: [
              Color(0xFF3F51EB),
              Color(0xFF3F51EB),
              Color(0xFF9EA8FB),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 0.1,
                blurRadius: 1,
                offset: Offset(0, -2),
              ),
            ]),
        child: InkWell(
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 30,
                child: FittedBox(
                  child: Icon(
                    icon,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                flex: 50,
                child: Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    FittedBox(
                      child: Text(name,
                          style: themeLight.textTheme.bodyText1.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
              Spacer(
                flex: 30,
              ),
              Expanded(
                flex: 30,
                child: FittedBox(
                  child: Text(email,
                      style: themeLight.textTheme.bodyText1.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w300)),
                ),
              ),
              Spacer(flex: 40),
            ],
          ),
        ));
  }
}
