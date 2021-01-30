import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:online_team_management/controller/task_controller.dart';
import 'package:online_team_management/model/Team.dart';
import 'package:online_team_management/model/User.dart';
import 'package:online_team_management/util/extension.dart';
import 'package:online_team_management/view/task_view/widget/text_field.dart';
import 'package:online_team_management/view/team_view/widget/user_card.dart';
import 'package:online_team_management/widget/loading_view.dart';
import 'package:online_team_management/widget/transparent_route.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CreateTaskView extends StatelessWidget {
  Team team;
  CreateTaskView({this.team});
  @override
  Widget build(BuildContext context) {
    FocusScopeNode node = FocusScopeNode();
    return Scaffold(
      backgroundColor: context.themeData.primaryColorLight,
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: Text(
          "Create Task",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: context.themeData.primaryColorDark,
              fontSize: context.dynamicWidth(0.05)),
        ),
      ),
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            Navigator.push(
                context, TransparentRoute(builder: (context) => LoadingView()));
            int errorCode =
                await Provider.of<TaskController>(context, listen: false)
                    .addTask(team.teamId);
            Navigator.pop(context);
            if (errorCode == null) {
              Navigator.pop(context, true);
            } else {
              if (errorCode == 0) {
                Flushbar(
                  title: "Oops",
                  message: "Something went wrong",
                  backgroundColor: Colors.red,
                )..show(context);
              } else if (errorCode == 1) {
                Flushbar(
                  title: "Oops",
                  message: "You must add content",
                  backgroundColor: Colors.red,
                )..show(context);
              } else if (errorCode == 2) {
                Flushbar(
                  title: "Oops",
                  message: "You must choose due date",
                  backgroundColor: Colors.red,
                )..show(context);
              } else if (errorCode == 3) {
                Flushbar(
                  title: "Oops",
                  message: "You must choose at least one member",
                  backgroundColor: Colors.red,
                )..show(context);
              }
            }
          },
          label: Text("Create")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Spacer(flex: 2),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: FittedBox(
                child: Text(
                  '1. Add Content',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
          Spacer(flex: 2),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: TextField(
                onChanged: (value) {
                  Provider.of<TaskController>(context, listen: false).content =
                      value;
                },
                style: TextStyle(color: Colors.black87),
                autofocus: true,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black45),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey))),
              ),
            ),
          ),
          Spacer(flex: 3),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: FittedBox(
                child: Text(
                  '2. Choose Due Date',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
          Spacer(flex: 1),
          Expanded(
            flex: 36,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SfDateRangePicker(
                  endRangeSelectionColor: Colors.white,
                  selectionColor: Colors.black,
                  rangeSelectionColor: Colors.white,
                  startRangeSelectionColor: Colors.white,
                  view: DateRangePickerView.month,
                  backgroundColor:
                      context.themeData.accentColor.withOpacity(0.4),
                  minDate: DateTime.now(),
                  onSelectionChanged: (arg) {
                    print(arg.value);
                    DateTime date = arg.value;
                    Provider.of<TaskController>(context, listen: false)
                        .dueDate = date;
                  },
                ),
              ),
            ),
          ),
          Spacer(flex: 2),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: FittedBox(child: Text("3. Choose Members")),
            ),
          ),
          Expanded(
            flex: 32,
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
