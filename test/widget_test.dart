// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:online_team_management/controller/home_controller.dart';
import 'package:online_team_management/controller/sign_up_controller.dart';
import 'package:online_team_management/controller/task_controller.dart';
import 'package:online_team_management/controller/team_controller.dart';
import 'package:online_team_management/main.dart';
import 'package:online_team_management/model/Task.dart';
import 'package:online_team_management/model/Team.dart';
import 'package:online_team_management/model/User.dart';

void main() {
  test("Email Validate", () {
    SignUpController controller = SignUpController();
    controller.email = "example@mail.com";

    //if have some error return String type error message. else null
    expect(null, controller.emailValidator());
  });
  test("Password Validate", () {
    SignUpController controller = SignUpController();
    controller.password = "123456";

    //if have some error return String type error message. else null
    expect(null, controller.passwordValidator());
  });

  test("Confirm Password Validate", () {
    SignUpController controller = SignUpController();
    controller.password = "123456";
    controller.confirmPassword = "123456";

    //if password and confirm password is not equal return String type error message. else null
    expect(null, controller.confirmPasswordValidator());
  });

  test("Current User Tasks Count Test", () async {
    TaskController controller = TaskController();
    List<Task> tasks = await controller.getUserTasks();
    int tasksCount = tasks.length;

    //if current user tasks count equal 4
    expect(4, tasksCount);
  });

  test("Current User Team Count Test", () async {
    HomeController controller = HomeController();
    User user = await controller.currentUser();
    int teamsCount = user.membership.length;

    //if current user membership of teams count equal 2
    expect(2, teamsCount);
  });
}
