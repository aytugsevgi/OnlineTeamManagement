import 'package:flutter/material.dart';
import 'package:online_team_management/util/extension.dart';

class TaskDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          title: Text(
            "Here, I Found Your Tasks",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: context.themeData.primaryColorDark,
                fontSize: context.dynamicWidth(0.05)),
          ),
        ),
        body: Column(
          children: [],
        ));
  }

  Widget commentCard() {}
}
