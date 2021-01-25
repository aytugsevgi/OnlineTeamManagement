import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:online_team_management/model/Task.dart';
import 'package:online_team_management/model/User.dart';
import 'package:online_team_management/service/task_service.dart';
import 'package:online_team_management/service/user_service.dart';
import 'package:uuid/uuid.dart';

class TaskController with ChangeNotifier {
  List<User> tempUsers = [];
  List<String> members = [];
  String content = "";
  DateTime dueDate = DateTime(2021, 2, 20);
  DateTime createdAt;

  void deleteUserFromList(index) {
    tempUsers.removeAt(index);
    print(tempUsers.length);
    notifyListeners();
  }

  Future<void> addTask(String teamId) async {
    DateTime createdAt = DateTime.now();
    var uuid = Uuid();
    String id = uuid.v1();
    Task task = new Task(
        taskId: id,
        teamId: teamId,
        members: members,
        content: content,
        dueDate: dueDate,
        createdAt: createdAt);

    await TaskService().addTask(task);
  }

  Future<void> updateTaskContent(String taskId, String givenContent) async {
    TaskService().updateTaskContent(taskId, givenContent);
  }

  Future<bool> updateTaskMembers(
      @required String taskId, @required List<String> members) async {
    return TaskService().updateTaskMembers(taskId, members);
  }

  Future<bool> assignTask(
      @required String taskId, @required List<String> users) async {
    return TaskService().assignTask(taskId, users);
  }

  Future<bool> deleteTask(@required String taskId) async {
    return TaskService().deleteTask(taskId);
  }

  Future<List<Task>> getUserTasks() async {
    return UserService().getUserTasks();
  }
}
