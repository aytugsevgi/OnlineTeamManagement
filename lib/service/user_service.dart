import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:online_team_management/model/Task.dart';
import 'package:online_team_management/model/Team.dart';
import 'package:online_team_management/model/User.dart';
import 'package:online_team_management/service/auth_service.dart';
import 'package:online_team_management/service/task_service.dart';

class UserService {
  Firestore _firestore = Firestore.instance;

  Future<bool> saveUser(User user) async {
    try {
      await _firestore
          .collection("users")
          .document(user.userId)
          .setData(user.toJson());
      return true;
    } catch (e) {
      print("DEBUG couldn't save $e");
      return false;
    }
  }

  Future<bool> updateUser(User user) async {
    try {
      await Firestore.instance
          .collection('users')
          .document(user.userId)
          .setData(user.toJson());
      return true;
    } catch (e) {
      print("DEBUG: Error UserService updateUser: $e");
      return false;
    }
  }

  Future<User> searchUser(String uid) async {
    try {
      DocumentSnapshot currentUser =
          await _firestore.collection("users").document(uid).get();
      Map<String, dynamic> temp = currentUser.data;
      User user = User.fromJson(temp);
      return user;
    } catch (e) {
      return null;
    }
  }

  Future<List<Team>> getTeams() async {
    try {
      List<Team> foundTeamList = new List();
      print("1");
      List<String> membershipList =
          (await AuthService().currentUser()).membership;
      print(membershipList.length);
      for (var x in membershipList) {
        DocumentSnapshot currentTeam =
            await _firestore.collection("teams").document(x).get();
        print("2");
        Map<String, dynamic> temp = currentTeam.data;
        print("3");
        Team team = Team.fromJson(temp);
        print("4");
        foundTeamList.add(team);
      }
      return foundTeamList;
    } catch (e) {
      print("DEBUG: Error couldn't get user's tems $e");
      return null;
    }
  }

  Future<List<Task>> getUserTasks() async {
    try {
      List<Task> allTask = await TaskService().getAllTask();

      List<Task> currentUserTasks = new List();

      for (var x in allTask) {
        if (x.members.contains(AuthService().currentUserId())) {
          currentUserTasks.add(x);
        }
      }
      return currentUserTasks;
    } catch (e) {
      print("DEBUG: Error couldn't get user's task!");
      return null;
    }
  }

  Future<List<DocumentSnapshot>> searchUserFromEmail(String searchText) async {
    try {
      List<DocumentSnapshot> documentList = (await Firestore.instance
              .collection("users")
              .where("email", isEqualTo: searchText)
              .getDocuments())
          .documents;

      int length = documentList.length;

      print("DEBUG: length of users $length");

      return documentList;
    } catch (e) {
      return null;
    }
  }
}
