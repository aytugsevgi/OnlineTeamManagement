import 'package:awesome_page_transitions/awesome_page_transitions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_team_management/util/extension.dart';
import 'package:online_team_management/view/team_view/create_team_view.dart';
import 'package:online_team_management/view/team_view/widget/team_card.dart';

class TeamView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.themeData.primaryColorLight,
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: Text(
          "Here, I Found Your Teams",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: context.themeData.primaryColorDark,
              fontSize: context.dynamicWidth(0.05)),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
                context,
                AwesomePageRoute(
                    transitionDuration: Duration(milliseconds: 400),
                    exitPage: TeamView(),
                    enterPage: CreateTeamView(),
                    transition: CubeTransition()));
          },
          label: Row(
            children: [
              Text(
                "Create Team",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: context.themeData.primaryColorLight,
                    fontSize: context.dynamicWidth(0.04)),
              ),
              Icon(Icons.arrow_right),
            ],
          )),
      body: Column(
        children: <Widget>[
          Spacer(flex: 2),
          Expanded(
            flex: 10,
            child: searchField(context),
          ),
          Expanded(
            flex: 88,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.dynamicWidth(0.06),
              ),
              child: ListView(
                children: [
                  SizedBox(
                    height: context.dynamicHeight(0.21),
                    width: context.dynamicWidth(0.6),
                    child: TeamCard(
                      title: "Power Puff Girls",
                      countOfMembers: "10",
                    ),
                  ),
                  SizedBox(
                    height: context.dynamicHeight(0.21),
                    width: context.dynamicWidth(0.6),
                    child: TeamCard(
                      title: "Star Wars",
                      countOfMembers: "21",
                    ),
                  ),
                  SizedBox(
                    height: context.dynamicHeight(0.21),
                    width: context.dynamicWidth(0.6),
                    child: TeamCard(
                      title: "Figth Clup",
                      countOfMembers: "14",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding searchField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.dynamicWidth(0.1)),
      child: TextFormField(
        onChanged: (value) {},
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
                onPressed: () {}),
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
