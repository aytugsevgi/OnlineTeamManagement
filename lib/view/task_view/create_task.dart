import 'package:flutter/material.dart';
import 'package:online_team_management/controller/task_controller.dart';
import 'package:online_team_management/model/Team.dart';
import 'package:online_team_management/model/User.dart';
import 'package:online_team_management/view/task_view/widget/text_field.dart';
import 'package:online_team_management/view/team_view/widget/user_card.dart';
import 'package:provider/provider.dart';

class CreateTaskView extends StatelessWidget {
  Team team;
  CreateTaskView({this.team});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Provider.of<TaskController>(context, listen: false)
                .addTask(team.teamId);
          },
          label: Text("Create")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Spacer(flex: 10),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Text(
                'Create new task',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Spacer(flex: 2),
          Expanded(
            flex: 10,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: TextField(
                style: TextStyle(color: Colors.black87),
                decoration: InputDecoration(
                    hintText: "Content",
                    labelStyle: TextStyle(color: Colors.black45),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey))),
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: TextField(
                style: TextStyle(color: Colors.black87),
                decoration: InputDecoration(
                    hintText: "Due Date",
                    labelStyle: TextStyle(color: Colors.black45),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey))),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: FittedBox(child: Text("Choose Members")),
            ),
          ),
          Expanded(
            flex: 52,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: Provider.of<TaskController>(context, listen: true)
                  .tempUsers
                  .length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: UserCard(
                      user: Provider.of<TaskController>(context, listen: true)
                          .tempUsers[index],
                      onTap: () {
                        Provider.of<TaskController>(context, listen: false)
                            .members
                            .add(Provider.of<TaskController>(context,
                                    listen: false)
                                .tempUsers[index]
                                .userId);
                        Provider.of<TaskController>(context, listen: false)
                            .deleteUserFromList(index);
                        print(
                            Provider.of<TaskController>(context, listen: false)
                                .members
                                .length
                                .toString());
                      }),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
