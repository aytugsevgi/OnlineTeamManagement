import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_team_management/model/Task.dart';
import 'package:online_team_management/util/extension.dart';
import 'package:online_team_management/view/task_view/task_detail.dart';
import 'package:online_team_management/view/task_view/widget/task_card.dart';
import 'package:online_team_management/widget/fade_route.dart';

class RepoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Hero(
          tag: "$index",
          child: Material(
            child: SizedBox(
              height: context.dynamicHeight(0.18),
              width: context.dynamicWidth(1),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.dynamicHeight(0.05),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(FadeRoute(
                        page: TaskDetail(
                      index: index,
                    )));
                  },
                  child: TaskCard(
                    index: index,
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
            ),
          ),
        );
      },
    );
  }
}
