import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_team_management/theme/theme.dart';
import 'package:online_team_management/util/extension.dart';
import 'package:online_team_management/view/team_view/team_detail_view.dart';

class TeamCard extends StatelessWidget {
  String title;
  String countOfMembers;
  bool interactive;
  List<Color> colors;
  TeamCard(
      {Key key,
      this.title,
      this.countOfMembers,
      this.interactive = true,
      this.colors = const [
        Color(0xFF3F51EB),
        Color(0xFF3F51EB),
        Color(0xFF9EA8FB),
      ]})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
              padding: EdgeInsets.symmetric(
                  vertical: context.dynamicHeight(0.03),
                  horizontal: context.dynamicWidth(0.04)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  gradient: LinearGradient(
                      colors: colors,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 0.1,
                      blurRadius: 1,
                      offset: Offset(0, -2),
                    ),
                  ]),
              child: InkWell(
                onTap: () {
                  if (interactive) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TeamDetailView()));
                  }
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 30,
                      child: FittedBox(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              CupertinoIcons.group_solid,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("$countOfMembers Members",
                                style: themeLight.textTheme.bodyText1.copyWith(
                                    fontSize: 10,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400)),
                          ],
                        ),
                      ),
                    ),
                    Spacer(flex: 35),
                    Expanded(
                      flex: 19,
                      child: FittedBox(
                        child: Text(title,
                            style: themeLight.textTheme.bodyText1.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Spacer(
                      flex: 20,
                    ),
                  ],
                ),
              )),
          interactive
              ? Positioned(
                  right: 10,
                  bottom: 0,
                  top: 0,
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.right_chevron,
                        color: Colors.white,
                      ),
                    ],
                  ),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
