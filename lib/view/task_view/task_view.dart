import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_team_management/controller/task_controller.dart';
import 'package:online_team_management/model/Task.dart';
import 'package:online_team_management/util/extension.dart';
import 'package:online_team_management/view/task_view/progress_task_detail.dart';
import 'package:online_team_management/view/task_view/task_detail.dart';
import 'package:online_team_management/view/task_view/widget/task_card.dart';
import 'package:online_team_management/widget/fade_route.dart';

class TaskView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.themeData.primaryColorLight,
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.dynamicWidth(0.1)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(flex: 5),
            Expanded(
              flex: 4,
              child: FittedBox(
                child: Text(
                  "No Task, No Money",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: context.themeData.primaryColorDark,
                  ),
                ),
              ),
            ),
            Spacer(flex: 3),
            Expanded(
              flex: 86,
              child: FutureBuilder<List<Task>>(
                  future: TaskController().getUserTasks(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        List<Task> tasks = snapshot.data;
                        return ListView.builder(
                          itemCount: tasks.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            Task task = tasks[index];
                            return Hero(
                              tag: "${task.taskId}",
                              child: Material(
                                child: SizedBox(
                                  height: context.dynamicHeight(0.18),
                                  width: context.dynamicWidth(1),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(FadeRoute(
                                          page: ProgressTaskDetail(
                                        task: task,
                                      )));
                                    },
                                    child: TaskCard(
                                      colors: [
                                        Color(0xFF74CCA2),
                                        Color(0xFF74CCA2),
                                        Color(0xFF9EE8D1),
                                      ],
                                      task: task,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return SizedBox.shrink();
                      }
                    }
                    return Center(child: CircularProgressIndicator());
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
