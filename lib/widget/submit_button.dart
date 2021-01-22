import 'package:flutter/material.dart';
import 'package:online_team_management/util/extension.dart';

class SubmitButton extends StatelessWidget {
  final Widget child;
  final Function onTap;
  final List<Color> colors;

  const SubmitButton(
      {Key key,
      @required this.child,
      @required this.onTap,
      this.colors = const [Colors.blue, Colors.teal]})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: context.dynamicHeight(0.06),
          width: context.dynamicWidth(0.8),
          child: RaisedButton(
            onPressed: onTap,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80.0)),
            padding: EdgeInsets.all(0.0),
            child: Ink(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: colors,
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(30.0)),
              child: Container(
                  constraints: BoxConstraints(
                      maxWidth: context.dynamicWidth(0.8),
                      minHeight: context.dynamicHeight(0.06)),
                  alignment: Alignment.center,
                  child: child),
            ),
          ),
        ),
      ],
    );
  }
}
