import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double dynamicWidth(double value) => MediaQuery.of(this).size.width * value;
  double dynamicHeight(double value) => MediaQuery.of(this).size.height * value;
  ThemeData get themeData => Theme.of(this);
}
