import 'package:flutter/material.dart';
import 'package:online_team_management/model/User.dart';
import 'package:online_team_management/util/extension.dart';

class UserCard extends StatelessWidget {
  final User user;
  final Function onTap;

  const UserCard({Key key, this.user, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
          child: ListTile(
            leading:
                Icon(Icons.person, color: context.themeData.primaryColorDark),
            title: Text("${user.firstName} ${user.lastName}",
                style: TextStyle(color: context.themeData.primaryColorDark)),
            subtitle: Text("${user.email}",
                style: TextStyle(color: context.themeData.primaryColorDark)),
            trailing: IconButton(
                icon: Icon(Icons.add, color: Colors.green), onPressed: onTap),
          )),
    );
  }
}
