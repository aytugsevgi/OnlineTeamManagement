import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_team_management/util/extension.dart';
import 'package:online_team_management/view/chat_view/chat_detail_view.dart';
import 'package:online_team_management/view/chat_view/conference_view.dart';

class ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.themeData.primaryColorLight,
        appBar: _appBar(context),
        floatingActionButton: FloatingActionButton(
          heroTag: null,
          backgroundColor: Color(0xFFD93634),
          child: Icon(Icons.message_rounded,
              color: context.themeData.primaryColorLight, size: 26),
          onPressed: () {
            Flushbar(
              title: "Sorry",
              message: "This feature isn't implemented",
              duration: Duration(seconds: 2),
            )..show(context);
          },
        ),
        body: Column(
          children: [
            ListView(
              shrinkWrap: true,
              children: [
                _messageBar(
                  context: context,
                  chatID: "1",
                  userID: "1",
                  name: "Ceren Erdoğan",
                  email: "ceren@gmail.com",
                ),
                _messageBar(
                  context: context,
                  chatID: "1",
                  userID: "1",
                  name: "Sıla Eryılmaz",
                  email: "sıla@gmail.com",
                ),
                _messageBar(
                  context: context,
                  chatID: "1",
                  userID: "1",
                  name: "Beyza Sığınmış",
                  email: "beyza@gmail.com",
                ),
              ],
            ),
          ],
        ));
  }

  _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: false,
      leading: IconButton(
        icon: Icon(CupertinoIcons.back,
            color: context.themeData.primaryColorDark),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        "Promise, I'm Not Looking",
        style: context.themeData.textTheme.headline
            .copyWith(fontSize: 18, color: context.themeData.primaryColorDark),
      ),
      actions: [
        IconButton(
            iconSize: 30,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ConferenceView()));
            },
            icon: Icon(Icons.video_call_outlined,
                color: context.themeData.accentColor)),
        SizedBox(
          width: 16,
        )
      ],
    );
  }

  _messageBar({
    @required BuildContext context,
    int newMessageCount = 0,
    String chatID,
    String userID,
    String name,
    String photoUrl,
    String email,
  }) {
    return Container(
        width: context.dynamicWidth(1.0),
        height: 70,
        decoration: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(color: context.themeData.primaryColor, width: 1)),
        ),
        child: ListTile(
          onTap: () {
            _navigateAndDisplaySelection(context, name, email);
          },
          leading: SizedBox(
            height: 40,
            width: 40,
            child: Stack(children: [
              Icon(Icons.person, color: context.themeData.primaryColorDark),
              Align(
                alignment: Alignment(0.9, -0.9),
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
              )
            ]),
          ),
          title: Text(
            name,
            style: context.themeData.textTheme.bodyText1
                .copyWith(fontWeight: FontWeight.w500, fontSize: 14),
          ),
          subtitle: Text(
            email,
            style: context.themeData.textTheme.bodyText1.copyWith(
                fontSize: 12,
                fontWeight:
                    newMessageCount == 0 ? FontWeight.w300 : FontWeight.w500),
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Spacer(
                flex: 14,
              ),
              Expanded(
                flex: 20,
                child: Text(
                  "8:36PM",
                  style: context.themeData.textTheme.bodyText1
                      .copyWith(fontSize: 12, fontWeight: FontWeight.w300),
                ),
              ),
              Expanded(
                flex: 20,
                child: newMessageCount == 0
                    ? SizedBox.shrink()
                    : Container(
                        height: 16,
                        width: 16,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: context.themeData.primaryColorDark),
                        child: Text(
                          "3",
                          style: context.themeData.textTheme.bodyText1.copyWith(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: context.themeData.primaryColor),
                        )),
              ),
              Spacer(
                flex: 14,
              )
            ],
          ),
        ));
  }

  _navigateAndDisplaySelection(
      BuildContext context, String name, String email) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ChatDetailView(name: name, email: email)));
  }
}
