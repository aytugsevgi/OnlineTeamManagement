import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:online_team_management/model/Task.dart';

class TaskService {
  Firestore _firestore = Firestore.instance;

  Future<String> addTask(Task task) async {
    try {
      DocumentReference newTask =
          await _firestore.collection("tasks").add(task.toJson());
      return newTask.documentID;
    } catch (e) {
      print("DEBUG couldn't save $e");
      return null;
    }
  }

  Future<void> updateTaskContent(String taskId, String givenContent) async {
    Firestore.instance
        .collection('tasks')
        .document(taskId)
        .setData({'content': givenContent});
  }

  Future<bool> updateTaskMembers(
      @required String taskId, @required List<String> members) async {
    Firestore.instance
        .collection('tasks')
        .document(taskId)
        .setData({'members': members});
  }

  Future<String> assignTask(
      @required String taskId, @required List<String> users) async {
    DocumentSnapshot foundTask =
        await _firestore.collection("tasks").document(taskId).get();
    Map<String, dynamic> temp = foundTask.data;
    Task task = Task.fromJson(temp);

    task.members = users;

    Firestore.instance
        .collection('tasks')
        .document(taskId)
        .setData({'members': task.members});
  }

  Future<bool> deleteTask(@required String taskId) async {
    try {
      await _firestore.collection("tasks").document(taskId).delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<String> checkCompletedTask(@required String taskId) async {}
}
