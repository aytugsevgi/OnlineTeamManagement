import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_team_management/model/Task.dart';
import 'package:online_team_management/theme/theme.dart';
import 'package:online_team_management/util/extension.dart';

class TaskCard extends StatelessWidget {
  Task task;
  List<Color> colors;
  bool isDone;
  TaskCard(
      {Key key,
      this.task,
      this.isDone,
      this.colors = const [
        Color(0xFF3F51EB),
        Color(0xFF3F51EB),
        Color(0xFF9EA8FB),
      ]})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
          padding: EdgeInsets.only(left: context.dynamicWidth(0.04)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              gradient: LinearGradient(colors: [
                context.themeData.primaryColor,
                context.themeData.primaryColorLight,
                context.themeData.primaryColorLight,
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 0.1,
                  blurRadius: 1,
                  offset: Offset(0, -2),
                ),
              ]),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 22,
                child: FittedBox(
                  child: Text("Due Date\n14.02.2021",
                      textAlign: TextAlign.center,
                      style: themeLight.textTheme.bodyText1.copyWith(
                          fontSize: 10,
                          color: context.themeData.primaryColorDark,
                          fontWeight: FontWeight.w700)),
                ),
              ),
              Spacer(flex: 2),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  width: 1,
                  color: Colors.grey,
                ),
              ),
              Spacer(flex: 2),
              Expanded(
                flex: 52,
                child: Text("Ui of the task screen will be done.",
                    style: themeLight.textTheme.bodyText1.copyWith(
                        color: context.themeData.primaryColorDark,
                        fontWeight: FontWeight.bold)),
              ),
              Spacer(
                flex: 2,
              ),
              Expanded(
                flex: 20,
                child: cardRightArea(context, isDone),
              )
            ],
          )),
    );
  }

  Container cardRightArea(BuildContext context, bool isDone) {
    if (isDone) {
      return Container(
        color: Color(0xFF74CCA2),
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Transform.rotate(
            angle: pi / 2.0,
            child: Text("DONE",
                style: themeLight.textTheme.bodyText1.copyWith(
                    color: context.themeData.primaryColorLight,
                    fontWeight: FontWeight.bold)),
          ),
        ),
      );
    }
    return Container(
      color: Color(0xFFD79B3B),
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Transform.rotate(
          angle: pi / 2.0,
          child: FittedBox(
            child: Text("PROGRESS",
                style: themeLight.textTheme.bodyText1.copyWith(
                    color: context.themeData.primaryColorLight,
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}
