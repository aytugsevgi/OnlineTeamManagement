import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:online_team_management/model/Task.dart';
import 'package:online_team_management/service/task_service.dart';

class TaskController {
  String taskId;
  String teamId;
  List<String> members;
  String content;
  Timestamp dueDate;
  Timestamp createdAt;

  Future<String> addTask(Task task) async {
    DateTime date = DateTime.now();
    Timestamp createdAt = Timestamp.fromDate(date);

    Task task = new Task(
        taskId: taskId,
        teamId: teamId,
        members: members,
        content: content,
        dueDate: dueDate,
        createdAt: createdAt);

    return TaskService().addTask(task);
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
}
