import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_team_management/controller/team_controller.dart';
import 'package:online_team_management/model/User.dart';
import 'package:online_team_management/util/extension.dart';
import 'package:online_team_management/view/team_view/widget/team_card.dart';
import 'package:online_team_management/view/team_view/widget/user_card.dart';
import 'package:provider/provider.dart';

class CreateTeamView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.themeData.primaryColorLight,
        resizeToAvoidBottomInset: true,
        resizeToAvoidBottomPadding: false,
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
        body: SingleChildScrollView(
          physics: ScrollPhysics(parent: NeverScrollableScrollPhysics()),
          child: SizedBox(
            height: context.dynamicHeight(0.90),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(
                  flex: 2,
                ),
                Expanded(
                  flex: 30,
                  child: Center(
                    child: SizedBox(
                      width: context.dynamicWidth(0.8),
                      child: TeamCard(
                        title: Provider.of<TeamController>(context,
                                        listen: true)
                                    .createdTeamName ==
                                ""
                            ? "Team Name"
                            : Provider.of<TeamController>(context, listen: true)
                                .createdTeamName,
                        countOfMembers:
                            Provider.of<TeamController>(context, listen: true)
                                .createdTeamMembers
                                .length
                                .toString(),
                        interactive: false,
                      ),
                    ),
                  ),
                ),
                Spacer(
                  flex: 2,
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: context.dynamicWidth(0.05),
                    ),
                    child: FittedBox(
                      child: Text(
                        "1. Add name to your team",
                        style: TextStyle(
                            color: context.themeData.primaryColorDark,
                            fontSize: context.dynamicWidth(0.06)),
                      ),
                    ),
                  ),
                ),
                Spacer(
                  flex: 2,
                ),
                Expanded(
                  flex: 15,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: context.dynamicWidth(0.1)),
                    child: TextFormField(
                        decoration: new InputDecoration(
                          hintText: "Team Name",
                        ),
                        onChanged: (String value) {
                          Provider.of<TeamController>(context, listen: false)
                              .createdTeamName = value;
                        }),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: context.dynamicWidth(0.05),
                    ),
                    child: FittedBox(
                      child: Text(
                        "2. Add members to your team",
                        style: TextStyle(
                            color: context.themeData.primaryColorDark,
                            fontSize: context.dynamicWidth(0.06)),
                      ),
                    ),
                  ),
                ),
                Spacer(
                  flex: 2,
                ),
                Expanded(flex: 10, child: searchField(context)),
                Spacer(flex: 2),
                Expanded(
                  flex: 14,
                  child: getSearchedUser(context),
                ),
                Expanded(
                  flex: 22,
                  child: Align(
                    alignment: Alignment(0.94, 0.6),
                    child: FloatingActionButton.extended(
                        onPressed: () async {
                          await Provider.of<TeamController>(context,
                                  listen: false)
                              .createTeam();
                          Navigator.pop(context);
                        },
                        label: Text("Create")),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget getSearchedUser(context) {
    User user = Provider.of<TeamController>(context, listen: true).user;
    if (user == null) {
      return SizedBox.shrink();
    }
    return UserCard(
        user: user,
        onTap: () {
          Provider.of<TeamController>(context, listen: false)
              .addCreatedTeamMember(user);
        });
  }

  Widget searchField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.dynamicWidth(0.1)),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        onFieldSubmitted: (value) {
          Provider.of<TeamController>(context, listen: false)
              .searchUserFromEmail();
        },
        onChanged: (value) {
          Provider.of<TeamController>(context, listen: false).searchText =
              value;
        },
        decoration: InputDecoration(
          hintText: "Search member for adding team",
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
