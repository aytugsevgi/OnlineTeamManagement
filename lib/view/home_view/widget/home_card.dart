import 'package:flutter/material.dart';
import 'package:online_team_management/theme/theme.dart';
import 'package:online_team_management/util/extension.dart';

class HomeCard extends StatelessWidget {
  final List<Color> colors;
  final IconData icon;
  final String title;
  final String subtitle;
  final Function onTap;
  const HomeCard(
      {Key key, this.colors, this.icon, this.title, this.subtitle, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
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
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 25,
                child: FittedBox(
                  child: Icon(
                    icon,
                    color: Colors.white,
                  ),
                ),
              ),
              Spacer(flex: 40),
              Expanded(
                flex: 16,
                child: FittedBox(
                  child: Text(title,
                      style: themeLight.textTheme.bodyText1.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
              Spacer(
                flex: 10,
              ),
              Expanded(
                flex: 13,
                child: FittedBox(
                  child: Text(subtitle,
                      style: themeLight.textTheme.bodyText1.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w300)),
                ),
              ),
            ],
          ),
        ));
  }
}
