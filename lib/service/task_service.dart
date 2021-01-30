import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:online_team_management/model/Task.dart';
import 'package:online_team_management/model/Team.dart';
import 'package:online_team_management/model/User.dart';
import 'package:online_team_management/service/team_service.dart';
import 'package:online_team_management/service/user_service.dart';

class TaskService {
  Firestore _firestore = Firestore.instance;

  Future<void> addTask(Task task) async {
    try {
      await _firestore
          .collection("tasks")
          .document(task.taskId)
          .setData(task.toJson());
      await TeamService().addTaskToTeam(task.teamId, task);
    } catch (e) {
      print("DEBUG couldn't save $e");
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

  Future<void> checkCompletedTask(Task task) async {
    task.isDone = true;
    await Firestore.instance
        .collection('tasks')
        .document(task.taskId)
        .setData(task.toJson());
  }

  Future<Task> searchTask(String taskId) async {
    DocumentSnapshot _snapshot =
        await Firestore.instance.collection('tasks').document(taskId).get();
    print(_snapshot.data);
    Task task = Task.fromJson(_snapshot.data);
    return task;
  }

  Future<List<Task>> getAllTask() async {
    List<DocumentSnapshot> templist;
    List<Map<dynamic, dynamic>> list = new List();
    List<Task> allTask = new List();

    CollectionReference collectionRef = Firestore.instance.collection("tasks");
    QuerySnapshot collectionSnapshot = await collectionRef.getDocuments();

    templist = collectionSnapshot.documents;

    list = templist.map((DocumentSnapshot docSnapshot) {
      return docSnapshot.data;
    }).toList();

    for (var x in list) {
      Task task = Task.fromJson(x);
      allTask.add(task);
    }
    return allTask;
  }

  Future<List<User>> getTaskMembers(Task task) async {
    List<User> userList = new List();
    try {
      for (var x in task.members) {
        userList.add(await UserService().searchUser(x));
      }
      return userList;
    } catch (e) {
      print("DEBUG: Error couldn't get team's members!");
      return null;
    }
  }
}
