import 'package:awesome_page_transitions/awesome_page_transitions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:online_team_management/controller/home_controller.dart';
import 'package:online_team_management/model/User.dart';
import 'package:online_team_management/util/extension.dart';
import 'package:online_team_management/view/auth_view/login_view.dart';
import 'package:online_team_management/view/chat_view/chat_detail_view.dart';
import 'package:online_team_management/view/chat_view/chat_view.dart';
import 'package:online_team_management/view/home_view/widget/home_card.dart';
import 'package:online_team_management/view/home_view/widget/settings_view.dart';
import 'package:online_team_management/view/repo_view/repo_view.dart';
import 'package:online_team_management/view/task_view/task_view.dart';
import 'package:online_team_management/view/team_view/team_view.dart';
import 'package:online_team_management/widget/fade_route.dart';
import 'package:online_team_management/widget/loading_view.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  final ZoomDrawerController _zoomDrawerController = ZoomDrawerController();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User>(
        future:
            Provider.of<HomeController>(context, listen: false).currentUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Material(color: Colors.white, child: LoadingView());
          }
          return ZoomDrawer(
            controller: _zoomDrawerController,
            menuScreen: SettingsView(),
            borderRadius: 24.0,
            showShadow: true,
            angle: -12.0,
            backgroundColor: Colors.grey[300],
            slideWidth: MediaQuery.of(context).size.width * .65,
            openCurve: Curves.fastOutSlowIn,
            closeCurve: Curves.fastOutSlowIn,
            mainScreen: mainScreen(context, snapshot.data),
          );
        });
  }

  Scaffold mainScreen(BuildContext context, User user) {
    return Scaffold(
        backgroundColor: context.themeData.primaryColorLight,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.only(left: context.dynamicWidth(0.04)),
                  child: Row(
                    children: [
                      GestureDetector(
                          child: Icon(
                            Icons.menu,
                          ),
                          onTap: () {
                            bool isOpen = _zoomDrawerController.isOpen();
                            if (isOpen) {
                              _zoomDrawerController.close();
                            } else {
                              _zoomDrawerController.open();
                            }
                          }),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Hi, ${user.firstName}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: context.themeData.primaryColorDark,
                            fontSize: context.dynamicWidth(0.05)),
                      ),
                      Spacer(),
                      Image.asset(
                        "assets/diamond.png",
                        fit: BoxFit.contain,
                        height: 60,
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
              ),
              Spacer(flex: 6),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.dynamicWidth(0.08)),
                  child: FittedBox(
                    child: Text(
                      "Home Sweet Home!",
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
                          unselectedLabelColor: context
                              .themeData.primaryColorDark
                              .withOpacity(0.6),
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
                              homeTab(context, user),
                              RepoView(),
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

Widget homeTab(BuildContext context, User user) {
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
                    subtitle: "${user.membership.length} teams",
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
                    subtitle: "See your tasks",
                    onTap: () {
                      Navigator.of(context).push(
                        FadeRoute(
                          page: TaskView(),
                        ),
                      );
                    },
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
                    onTap: () {
                      Navigator.push(context, FadeRoute(page: ChatView()));
                    },
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
          )),
      Spacer(flex: 20),
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
