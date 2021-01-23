import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_team_management/controller/home_controller.dart';
import 'package:online_team_management/util/extension.dart';
import 'package:online_team_management/view/auth_view/login_view.dart';
import 'package:online_team_management/view/home_view/widget/home_card.dart';
import 'package:online_team_management/view/team_view/team_view.dart';
import 'package:online_team_management/widget/fade_route.dart';
import 'package:online_team_management/widget/loading_view.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.themeData.primaryColorLight,
        appBar: _appBar(context),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Spacer(flex: 6),
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: context.dynamicWidth(0.08)),
                child: FittedBox(
                  child: Text(
                    "Your things to do!",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: context.themeData.primaryColorDark,
                        fontSize: context.dynamicWidth(0.06)),
                  ),
                ),
              ),
            ),
            Spacer(flex: 5),
            Expanded(
              flex: 60,
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: context.dynamicWidth(0.08)),
                      child: TabBar(
                        indicatorColor: context.themeData.accentColor,
                        indicatorWeight: 1,
                        unselectedLabelStyle: TextStyle(
                            color: context.themeData.accentColor,
                            fontWeight: FontWeight.w400),
                        labelStyle: TextStyle(
                            color: context.themeData.accentColor,
                            fontWeight: FontWeight.w700),
                        labelColor: context.themeData.accentColor,
                        unselectedLabelColor:
                            context.themeData.primaryColorDark.withOpacity(0.6),
                        tabs: [
                          Tab(
                            text: "Home",
                          ),
                          Tab(text: "Repositories"),
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 63,
                        child: TabBarView(
                          children: [
                            homeTab(context),
                            repoTab(),
                          ],
                        ))
                  ],
                ),
              ),
            ),
            Spacer(flex: 13),
          ],
        ));
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: false,
      title: Text(
        "Hi, Ceren",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: context.themeData.primaryColorDark,
            fontSize: context.dynamicWidth(0.05)),
      ),
      actions: <Widget>[
        IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            icon: Icon(CupertinoIcons.settings_solid,
                size: context.dynamicWidth(0.1),
                color: context.themeData.primaryColorDark),
            onPressed: () async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoadingView()));
              bool isSuccess =
                  await Provider.of<HomeController>(context, listen: false)
                      .signOut();
              Navigator.pop(context);
              if (isSuccess) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginView()));
              }
            })
      ],
    );
  }
}

Widget homeTab(BuildContext context) {
  return Column(
    children: <Widget>[
      Spacer(flex: 10),
      Expanded(
          flex: 45,
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: context.dynamicWidth(0.08)),
            child: Row(
              children: <Widget>[
                Spacer(flex: 2),
                Expanded(
                  flex: 43,
                  child: HomeCard(
                    colors: [
                      Color(0xFF9EA8FB),
                      Color(0xFF3F51EB),
                      Color(0xFF3F51EB),
                    ],
                    icon: CupertinoIcons.group_solid,
                    title: "Team",
                    subtitle: "5 teams",
                    onTap: () {
                      Navigator.of(context).push(
                        FadeRoute(
                          page: TeamView(),
                        ),
                      );
                    },
                  ),
                ),
                Spacer(flex: 10),
                Expanded(
                  flex: 43,
                  child: HomeCard(
                    colors: [
                      Color(0xFF9EE8D1),
                      Color(0xFF74CCA2),
                      Color(0xFF74CCA2),
                    ],
                    icon: CupertinoIcons.bookmark_solid,
                    title: "Task",
                    subtitle: "2 tasks",
                  ),
                ),
                Spacer(flex: 2),
              ],
            ),
          )),
      Spacer(
        flex: 5,
      ),
      Expanded(
          flex: 45,
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: context.dynamicWidth(0.08)),
            child: Row(
              children: <Widget>[
                Spacer(flex: 2),
                Expanded(
                  flex: 43,
                  child: HomeCard(
                    colors: [
                      Color(0xFFE59596),
                      Color(0xFFD93634),
                      Color(0xFFD93634),
                    ],
                    icon: CupertinoIcons.conversation_bubble,
                    title: "Chat",
                    subtitle: "See messages",
                  ),
                ),
                Spacer(flex: 10),
                Expanded(
                  flex: 43,
                  child: HomeCard(
                    colors: [
                      Color(0xFFEFC99A),
                      Color(0xFFD79B3B),
                      Color(0xFFD79B3B),
                    ],
                    icon: CupertinoIcons.info,
                    title: "Report",
                    subtitle: "Detail",
                  ),
                ),
                Spacer(flex: 2),
              ],
            ),
          ))
    ],
  );
}

Widget repoTab() {
  return Container();
}

/*
HomeCard(colors: [
                  Color(0xFF9EA8FB),
                  Color(0xFF3F51EB),
                ], icon: Icons.home, title: "Home")),*/
