import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_team_management/model/Task.dart';
import 'package:online_team_management/util/extension.dart';
import 'package:online_team_management/view/task_view/widget/task_card.dart';

class RepoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        SizedBox(
          height: context.dynamicHeight(0.18),
          width: context.dynamicWidth(1),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.dynamicHeight(0.05),
            ),
            child: TaskCard(
              isDone: true,
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
        SizedBox(
          height: context.dynamicHeight(0.18),
          width: context.dynamicWidth(1),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.dynamicHeight(0.05),
            ),
            child: TaskCard(
              isDone: true,
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
        SizedBox(
          height: context.dynamicHeight(0.18),
          width: context.dynamicWidth(1),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.dynamicHeight(0.05),
            ),
            child: TaskCard(
              isDone: true,
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
        SizedBox(
          height: context.dynamicHeight(0.18),
          width: context.dynamicWidth(1),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.dynamicHeight(0.05),
            ),
            child: TaskCard(
              isDone: true,
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
        SizedBox(
          height: context.dynamicHeight(0.18),
          width: context.dynamicWidth(1),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.dynamicHeight(0.05),
            ),
            child: TaskCard(
              isDone: true,
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
      ],
    );
  }
}
