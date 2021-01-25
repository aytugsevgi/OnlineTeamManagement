import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_team_management/model/Task.dart';
import 'package:online_team_management/model/User.dart';
import 'package:online_team_management/util/extension.dart';
import 'package:online_team_management/view/task_view/widget/task_card.dart';
import 'package:online_team_management/view/team_view/widget/user_card.dart';

class TaskDetail extends StatelessWidget {
  int index;
  TaskDetail({this.index});
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
          children: [
            Expanded(
              child: Column(
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
                              isDone: true,
                              colors: [
                                Color(0xFF74CCA2),
                                Color(0xFF74CCA2),
                                Color(0xFF9EE8D1),
                              ],
                              task: Task(
                                  content: "Hello",
                                  members: ["1", "2"],
                                  dueDate: DateTime.now()),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Spacer(flex: 3),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: context.dynamicWidth(0.05),
                      ),
                      child: FittedBox(
                        child: Text("- Who did finish this task?",
                            style: TextStyle(
                                color: context.themeData.primaryColorDark)),
                      ),
                    ),
                  ),
                  Spacer(flex: 3),
                  Expanded(
                    flex: 13,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                              height: 50,
                              width: context.dynamicWidth(0.6),
                              child: userCard(
                                  context, "Sıla Eryılmaz", "sıla@gmail.com")),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                              height: 50,
                              width: context.dynamicWidth(0.6),
                              child: userCard(
                                  context, "Aytuğ Sevgi", "aytug@gmail.com")),
                        ),
                      ],
                    ),
                  ),
                  Spacer(flex: 2),
                  Center(
                    child: Container(
                      height: 1,
                      width: context.dynamicWidth(0.96),
                      color: Colors.grey,
                    ),
                  ),
                  Expanded(
                      flex: 48,
                      child: ListView(
                        children: [
                          commentCard("ceren@gmail.com", "Awesome!"),
                          commentCard("beyza@gmail.com",
                              "You have to deliver before due date"),
                          commentCard("sıla@gmail.com", "That was hard task"),
                          commentCard(
                              "aytug@gmail.com", "I think we need review"),
                        ],
                      ))
                ],
              ),
            ),
            _messageTextForm(context),
          ],
        ));
  }

  Widget userCard(BuildContext context, String name, String email) {
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
                        child: Text(name,
                            style: TextStyle(
                                color: context.themeData.primaryColorDark,
                                fontWeight: FontWeight.w600)),
                      ),
                      FittedBox(
                        child: Text(email,
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

  Widget commentCard(String sender, String message) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 10),
      leading: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Icon(Icons.person),
      ),
      title: RichText(
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          children: [
            TextSpan(
              text: "$sender  ",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            TextSpan(
                text: "$message",
                style: TextStyle(color: Colors.black, fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _messageTextForm(BuildContext context) {
    return Row(
      children: [
        Spacer(flex: 5),
        Expanded(
          flex: 85,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Material(
              borderRadius: BorderRadius.circular(10),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    minHeight: context.dynamicHeight(0.08),
                    maxHeight: context.dynamicHeight(0.2)),
                child: TextField(
                  onChanged: (value) {},
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  style: context.themeData.textTheme.bodyText1.copyWith(
                      fontSize: 14, color: context.themeData.primaryColorDark),
                  decoration: InputDecoration(
                    hintText: "Type something...",
                    hintStyle: context.themeData.textTheme.bodyText1
                        .copyWith(fontWeight: FontWeight.w300),
                    contentPadding: EdgeInsets.symmetric(horizontal: 8),
                    disabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: context.themeData.primaryColor)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: context.themeData.primaryColor)),
                  ),
                ),
              ),
            ),
          ),
        ),
        Spacer(
          flex: 2,
        ),
        Expanded(
          flex: 11,
          child: Container(
            decoration:
                BoxDecoration(color: Color(0xFF74CCA2), shape: BoxShape.circle),
            child: IconButton(
              icon: Icon(Icons.send, color: context.themeData.primaryColor),
              onPressed: () async {
                // gönderilecek kişi =>  user
                // gönderen kişi => CurrentUser().user
                // gönderilen mesaj => text
                // olarak değişkenleri kullanabilirsin
              },
            ),
          ),
        ),
        Spacer(
          flex: 2,
        ),
      ],
    );
  }
}
