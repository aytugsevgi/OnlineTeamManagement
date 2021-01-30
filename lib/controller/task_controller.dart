import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:online_team_management/model/Task.dart';
import 'package:online_team_management/model/User.dart';
import 'package:online_team_management/service/auth_service.dart';
import 'package:online_team_management/service/task_service.dart';
import 'package:online_team_management/service/user_service.dart';
import 'package:uuid/uuid.dart';

class TaskController with ChangeNotifier {
  List<User> tempUsers = [];
  List<String> members = [];
  String content = "";
  DateTime dueDate;
  DateTime createdAt;

  void deleteUserFromList(index) {
    tempUsers.removeAt(index);
    print(tempUsers.length);
    notifyListeners();
  }

  Future<int> addTask(String teamId) async {
    if (content == "") {
      return 1;
    }
    if (dueDate == null) {
      return 2;
    }
    if (members.length == 0) {
      return 3;
    }

    try {
      DateTime createdAt = DateTime.now();
      var uuid = Uuid();
      String id = uuid.v1();
      Task task = new Task(
        taskId: id,
        teamId: teamId,
        members: members,
        content: content,
        dueDate: dueDate,
        createdAt: createdAt,
        isDone: false,
      );

      await TaskService().addTask(task);
      resetData();
      return null;
    } catch (e) {
      print("DEBUG: ERROR TaskController addTask $e");
      return 0;
    }
  }

  void resetData() {
    tempUsers = [];
    members = [];
    content = "";
    dueDate = null;
  }

  Future<bool> isTaskBelongCurrentUser(Task task) async {
    String userId = await AuthService().currentUserId();
    return task.members.contains(userId);
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

  Future<List<User>> getTaskMembers(Task task) async {
    return await TaskService().getTaskMembers(task);
  }

  Future<void> checkCompletedTask(Task task) async {
    return await TaskService().checkCompletedTask(task);
  }
}
