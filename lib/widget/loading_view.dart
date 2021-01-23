import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(0.4),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
