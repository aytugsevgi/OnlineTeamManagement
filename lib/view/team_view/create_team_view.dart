import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_team_management/controller/team_controller.dart';
import 'package:online_team_management/util/extension.dart';
import 'package:provider/provider.dart';

class CreateTeamView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {}, label: Text("Create")),
        appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          title: Text(
            "Just do it",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: context.themeData.primaryColorDark,
                fontSize: context.dynamicWidth(0.05)),
          ),
        ),
        body: Column(
          children: [
            Spacer(
              flex: 10,
            ),
            Expanded(
              flex: 15,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: context.dynamicWidth(0.1)),
                child: TextFormField(
                    decoration: new InputDecoration(
                      hintText: "Team Name",
                    ),
                    onChanged: (String value) {}),
              ),
            ),
            Spacer(flex: 15),
            Expanded(flex: 15, child: searchField(context)),
            Expanded(
              flex: 45,
              child: Container(
                  child: Center(
                      child: Text(
                          Provider.of<TeamController>(context, listen: true)
                              .searchText,
                          style: TextStyle(color: Colors.black)))),
            )
          ],
        ));
  }

  Widget searchField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.dynamicWidth(0.1)),
      child: TextFormField(
        onChanged: (value) {
          Provider.of<TeamController>(context, listen: false).searchText =
              value;
        },
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: context.themeData.textTheme.headline4
              .copyWith(color: context.themeData.primaryColorDark),
          suffixIcon: Container(
            child: IconButton(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                icon: Icon(
                  CupertinoIcons.search,
                  color: Color(0xFF3F51EB),
                ),
                onPressed: () {
                  Provider.of<TeamController>(context, listen: false)
                      .searchUserFromEmail();
                }),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 12),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: context.themeData.primaryColor,
              width: 1,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: context.themeData.primaryColor,
              width: 1,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF3F51EB),
              width: 1,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
        ),
      ),
    );
  }
}
