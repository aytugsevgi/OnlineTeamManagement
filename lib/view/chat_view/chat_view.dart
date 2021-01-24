import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:online_team_management/util/extension.dart';

class ChatView extends StatelessWidget {
  ChatView({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: null,
      appBar: _appBar(context),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: context.dynamicWidth(1),
              color: context.themeData.primaryColor.withAlpha(200),
              padding: EdgeInsets.only(left: 8, right: 8, bottom: 0),
              child: _messageArea(context),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: _messageTextForm(context),
          )
        ],
      ),
    );
  }

  Widget _messageTextForm(BuildContext context) {
    return Row(
      children: [
        Spacer(flex: 5),
        Expanded(
          flex: 85,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Material(
              color: context.themeData.primaryColor.withOpacity(0.8),
              borderRadius: BorderRadius.circular(10),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    minHeight: context.dynamicHeight(0.08),
                    maxHeight: context.dynamicHeight(0.2)),
                child: TextField(
                  onChanged: (value) {},
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  style: context.themeData.textTheme.bodyText1.copyWith(
                      fontSize: 14, color: context.themeData.primaryColorDark),
                  decoration: InputDecoration(
                    hintText: "Type something...",
                    hintStyle: context.themeData.textTheme.bodyText1
                        .copyWith(fontWeight: FontWeight.w300),
                    contentPadding: EdgeInsets.symmetric(horizontal: 8),
                    disabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: context.themeData.primaryColor)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: context.themeData.primaryColor)),
                  ),
                ),
              ),
            ),
          ),
        ),
        Spacer(
          flex: 2,
        ),
        Expanded(
          flex: 11,
          child: Container(
            decoration:
                BoxDecoration(color: Color(0xFF3F51EB), shape: BoxShape.circle),
            child: IconButton(
              icon: Icon(Icons.send, color: context.themeData.primaryColor),
              onPressed: () async {
                // gönderilecek kişi =>  user
                // gönderen kişi => CurrentUser().user
                // gönderilen mesaj => text
                // olarak değişkenleri kullanabilirsin
              },
            ),
          ),
        ),
        Spacer(
          flex: 2,
        ),
      ],
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      elevation: 1,
      leading: IconButton(
          icon: Icon(CupertinoIcons.back),
          onPressed: () {
            Navigator.pop(context);
          }),
      centerTitle: false,
      leadingWidth: 40,
      title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(
          height: 40,
          width: 40,
          child: Stack(children: [
            /*CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage("${user.photoUrl}"),
            ),*/
            Icon(Icons.person),
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
        SizedBox(
          width: 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Aytuğ Sevgi",
              style: context.themeData.textTheme.bodyText1
                  .copyWith(fontWeight: FontWeight.w500, fontSize: 14),
            ),
            Text(
              "aytug@gmail.com",
              style: context.themeData.textTheme.bodyText1
                  .copyWith(fontWeight: FontWeight.w300, fontSize: 12),
            ),
          ],
        ),
      ]),
      actions: [
        IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        )
      ],
    );
  }

  _sendMessageBubble(
    BuildContext context,
    String text,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Stack(children: [
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.all(20),
            width: context.dynamicWidth(0.7),
            decoration: BoxDecoration(
              color: Color(0xFF3F51EB),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Text(
              "$text",
              style: context.themeData.textTheme.bodyText1.copyWith(
                  color: context.themeData.primaryColorLight, fontSize: 12),
            ),
          ),
        ),
        Positioned(
          bottom: 4,
          right: 10,
          child: Text(
            "10.22",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 10),
          ),
        ),
      ]),
    );
  }

  _recievedMessageBubble(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.all(20),
              width: context.dynamicWidth(0.7),
              decoration: BoxDecoration(
                  color: Color(0xFF9EA8FB),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Text(
                "$text",
                style: context.themeData.textTheme.bodyText1.copyWith(
                    color: context.themeData.primaryColorDark, fontSize: 12),
              ),
            ),
          ),
          Positioned(
            left: 10,
            bottom: 4,
            child: Text(
              "10.22",
              style: TextStyle(
                  color: context.themeData.primaryColorDark,
                  fontWeight: FontWeight.w400,
                  fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }

  _messageArea(BuildContext context) {
    return ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        shrinkWrap: true,
        reverse: true,
        children: [
          _recievedMessageBubble(
            context,
            "Son gün yetiştiririm :)",
          ),
          _sendMessageBubble(
            context,
            "Tasklerin bitti mi?",
          ),
          _recievedMessageBubble(
            context,
            "Selam",
          ),
          _sendMessageBubble(
            context,
            "Selam",
          ),
        ]);
  }
}
