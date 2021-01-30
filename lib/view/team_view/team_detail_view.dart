import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_team_management/controller/task_controller.dart';
import 'package:online_team_management/controller/team_controller.dart';
import 'package:online_team_management/model/Task.dart';
import 'package:online_team_management/model/Team.dart';
import 'package:online_team_management/model/User.dart';
import 'package:online_team_management/util/extension.dart';
import 'package:online_team_management/view/task_view/create_task.dart';
import 'package:online_team_management/view/task_view/progress_task_detail.dart';
import 'package:online_team_management/view/task_view/task_detail.dart';
import 'package:online_team_management/view/task_view/widget/task_card.dart';
import 'package:online_team_management/view/team_view/widget/team_detail_card.dart';
import 'package:online_team_management/widget/fade_route.dart';
import 'package:provider/provider.dart';

class TeamDetailView extends StatefulWidget {
  Team team;
  TeamDetailView({@required this.team});

  @override
  _TeamDetailViewState createState() => _TeamDetailViewState();
}

class _TeamDetailViewState extends State<TeamDetailView> {
  @override
  Widget build(BuildContext context) {
    List<User> teamMembers = [];
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Provider.of<TaskController>(context, listen: false).members = [];
          Provider.of<TaskController>(context, listen: false).content = "";
          Provider.of<TaskController>(context, listen: false).tempUsers =
              teamMembers;
          Navigator.of(context)
              .push(MaterialPageRoute(
                  builder: (context) => CreateTaskView(
                        team: widget.team,
                      )))
              .then((value) {
            if (value != null) {
              setState(() {});
            }
          });
          ;
        },
        label: Text(
          "Create Task",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: context.themeData.primaryColorLight,
              fontSize: context.dynamicWidth(0.04)),
        ),
      ),
      backgroundColor: context.themeData.primaryColorLight,
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: Text(
          "Your Team Details",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: context.themeData.primaryColorDark,
              fontSize: context.dynamicWidth(0.05)),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Spacer(flex: 2),
          Expanded(
            flex: 6,
            child: Padding(
              padding: EdgeInsets.only(
                left: context.dynamicWidth(0.05),
              ),
              child: Text(
                "Members",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: context.themeData.primaryColorDark,
                  fontSize: context.dynamicWidth(0.05),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 20,
            child: FutureBuilder<List<User>>(
                future: Provider.of<TeamController>(context, listen: false)
                    .getTeamsUsers(widget.team.teamId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      List<User> users = snapshot.data;
                      teamMembers = users;
                      return ListView.builder(
                        itemCount: users.length,
                        primary: false,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: SizedBox(
                              height: context.dynamicHeight(0.2),
                              width: context.dynamicWidth(0.5),
                              child: TeamDetailCard(
                                name:
                                    "${users[index].firstName} ${users[index].lastName}",
                                email: "${users[index].email}",
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return SizedBox.shrink();
                  }
                  return Center(child: CircularProgressIndicator());
                }),
          ),
          Spacer(flex: 2),
          Expanded(
            flex: 6,
            child: Padding(
              padding: EdgeInsets.only(
                left: context.dynamicWidth(0.05),
              ),
              child: Text(
                "Tasks",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: context.themeData.primaryColorDark,
                  fontSize: context.dynamicWidth(0.05),
                ),
              ),
            ),
          ),
          Expanded(
              flex: 69,
              child: FutureBuilder<List<Task>>(
                  future: Provider.of<TeamController>(context, listen: false)
                      .getTeamsTasks(widget.team.teamId),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        List<Task> tasks = snapshot.data;
                        return ListView.builder(
                          itemCount: tasks.length,
                          itemBuilder: (context, index) {
                            print(tasks[index].content);
                            return Hero(
                                tag: "${tasks[index].taskId}",
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
                                          Navigator.of(context)
                                              .push(FadeRoute(
                                                  page: ProgressTaskDetail(
                                                      task: tasks[index])))
                                              .then((value) {
                                            setState(() {});
                                          });
                                        },
                                        child: TaskCard(colors: [
                                          Color(0xFF74CCA2),
                                          Color(0xFF74CCA2),
                                          Color(0xFF9EE8D1),
                                        ], task: tasks[index]),
                                      ),
                                    ),
                                  ),
                                ));
                          },
                        );
                      }
                      return SizedBox.shrink();
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  })),
        ],
      ),
    );
  }
}
