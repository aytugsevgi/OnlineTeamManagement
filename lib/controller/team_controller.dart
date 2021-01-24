import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_team_management/model/Team.dart';
import 'package:online_team_management/model/User.dart';

import 'package:online_team_management/service/auth_service.dart';
import 'package:online_team_management/service/team_service.dart';
import 'package:online_team_management/service/user_service.dart';

class TeamController with ChangeNotifier {
  String teamId;
  String managerId;
  List<String> members;
  String teamName;
  String _searchText = "";
  User _user;
  String _createdTeamName = "";
  List<String> _createdTeamMembers = [];
  get createdTeamMembers => _createdTeamMembers;
  void addCreatedTeamMember(User value) {
    bool isAlreadyExist = false;
    for (String u in _createdTeamMembers) {
      if (u == value.userId) {
        isAlreadyExist = true;
        break;
      }
    }

    if (!isAlreadyExist) {
      _createdTeamMembers.add(value.userId);
      _user = null;
      notifyListeners();
    }
  }

  void clearCreatedTeamMember() {
    _createdTeamMembers.clear();
    notifyListeners();
  }

  get createdTeamName => _createdTeamName;
  set createdTeamName(String value) {
    _createdTeamName = value;
    notifyListeners();
  }

  get searchText => _searchText;
  set searchText(String value) {
    _searchText = value;
    notifyListeners();
  }

  get user => _user;
  set user(User value) {
    _user = value;
    notifyListeners();
  }

  Future<void> searchUserFromEmail() async {
    List<DocumentSnapshot> _documents =
        await UserService().searchUserFromEmail(searchText);
    if (_documents.isNotEmpty) {
      user = User.fromJson(_documents[0].data);
    } else {
      user = null;
    }
  }

  Future<bool> createTeam() async {
    String userId = await AuthService().currentUserId();
    Team team = new Team(
        teamId: teamId,
        managerId: userId,
        members: members,
        teamName: teamName);
    try {
      String createdTeamId = await TeamService().createTeam(team);
      User user = await AuthService().currentUser();
      user.membership.add(createdTeamId);
      await UserService().updateUser(user);
      return true;
    } catch (e) {
      print("DEBUG: Error TeamController createTeam : $e ");
      return false;
    }
  }

  Future<bool> updateTeamName(String teamId, String givenName) {
    return TeamService().updateTeamName(teamId, givenName);
  }

  Future<bool> addMemberToTeam(String teamId, User user) async {
    return TeamService().addMemberToTeam(teamId, user.userId);
  }

  Future<bool> deleteMemberFromTeam(String teamId, String userId) async {
    return TeamService().deleteMemberFromTeam(teamId, userId);
  }
}
