import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_team_management/model/Task.dart';
import 'package:online_team_management/model/User.dart';
import 'package:online_team_management/util/extension.dart';
import 'package:online_team_management/view/task_view/widget/task_card.dart';
import 'package:online_team_management/view/team_view/widget/user_card.dart';

class ProgressTaskDetail extends StatelessWidget {
  int index;
  ProgressTaskDetail({this.index});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.themeData.primaryColorLight,
        appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          title: Text(
            "Comment Me!",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: context.themeData.primaryColorDark,
                fontSize: context.dynamicWidth(0.05)),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 22,
              child: Hero(
                tag: "$index",
                child: Material(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: context.dynamicHeight(0.18),
                        maxWidth: context.dynamicWidth(0.8),
                      ),
                      child: TaskCard(
                        isDone: false,
                        colors: [
                          Color(0xFF74CCA2),
                          Color(0xFF74CCA2),
                          Color(0xFF9EE8D1),
                        ],
                        task: Task(
                            content: "Hello",
                            members: ["1", "2"],
                            dueDate: Timestamp.now()),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(flex: 2),
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.only(
                  left: context.dynamicWidth(0.05),
                ),
                child: FittedBox(
                  child: Text("- Who are doing this task?",
                      style:
                          TextStyle(color: context.themeData.primaryColorDark)),
                ),
              ),
            ),
            Spacer(flex: 2),
            Expanded(
              flex: 65,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        height: 50,
                        width: context.dynamicWidth(0.6),
                        child: userCard(context)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        height: 50,
                        width: context.dynamicWidth(0.6),
                        child: userCard(context)),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Widget userCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 4,
                spreadRadius: 0.2,
              ),
            ],
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [
                context.themeData.primaryColorLight,
                context.themeData.primaryColor,
                context.themeData.primaryColor,
                context.themeData.primaryColor,
              ],
            ),
          ),
          child: Row(
            children: [
              Spacer(flex: 5),
              Expanded(
                flex: 10,
                child: Icon(Icons.person,
                    color: context.themeData.primaryColorDark),
              ),
              Spacer(
                flex: 8,
              ),
              Expanded(
                  flex: 67,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FittedBox(
                        child: Text("Aytuğ Sevgi",
                            style: TextStyle(
                                color: context.themeData.primaryColorDark,
                                fontWeight: FontWeight.w600)),
                      ),
                      FittedBox(
                        child: Text("aytug@gmail.com",
                            style: TextStyle(
                                color: context.themeData.primaryColorDark)),
                      ),
                    ],
                  )),
              Spacer(flex: 10),
            ],
          )),
    );
  }
}
