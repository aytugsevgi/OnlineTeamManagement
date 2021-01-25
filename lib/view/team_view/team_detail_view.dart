import 'package:flutter/material.dart';
import 'package:online_team_management/util/extension.dart';
import 'package:online_team_management/view/team_view/widget/team_detail_card.dart';

class TeamDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.themeData.primaryColorLight,
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: Text(
          "Your Team Details",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: context.themeData.primaryColorDark,
              fontSize: context.dynamicWidth(0.05)),
        ),
      ),
      body: Column(
        children: <Widget>[
          Spacer(flex: 2),
          Expanded(
            flex: 10,
            child: Text("Members",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: context.themeData.primaryColorDark,
                    fontSize: context.dynamicWidth(0.05))),
          ),
          Expanded(
            flex: 30,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.dynamicWidth(0.06),
              ),
              child: ListView(
                primary: false,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      height: context.dynamicHeight(0.2),
                      width: context.dynamicWidth(0.5),
                      child: TeamDetailCard(
                        name: "Sıla Eryılmaz",
                        email: "slaeryilmaz3@gmail.com",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      height: context.dynamicHeight(0.2),
                      width: context.dynamicWidth(0.5),
                      child: TeamDetailCard(
                        name: "Ceren Erdoğan",
                        email: "cerenerdogan@gmail.com",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer(flex: 110),
        ],
      ),
    );
  }
}
