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

  Future<bool> updateTaskContent(String taskId, String givenContent) async {
    try {
      await Firestore.instance
          .collection('tasks')
          .document(taskId)
          .setData({'content': givenContent});
      return true;
    } catch (e) {
      print("DEBUG: Error TaskService updateTaskContent: $e");
      return false;
    }
  }

  Future<bool> updateTaskMembers(
      @required String taskId, @required List<String> members) async {
    try {
      await Firestore.instance
          .collection('tasks')
          .document(taskId)
          .setData({'members': members});
      return true;
    } catch (e) {
      print("DEBUG: TaskService updateTaskMembers: $e");
      return false;
    }
  }

  Future<bool> assignTask(
      @required String taskId, @required List<String> users) async {
    try {
      DocumentSnapshot foundTask =
          await _firestore.collection("tasks").document(taskId).get();
      Map<String, dynamic> temp = foundTask.data;
      Task task = Task.fromJson(temp);

      task.members = users;

      await Firestore.instance
          .collection('tasks')
          .document(taskId)
          .setData({'members': task.members});
      return true;
    } catch (e) {
      print("DEBUG: Error TaskService assignTask: $e");
      return false;
    }
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
