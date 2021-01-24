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
  List<User> members;
  String teamName;
  String _searchText = "";
  User _user;
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

  Future<List<DocumentSnapshot>> searchUserFromEmail() {
    UserService().searchUserFromEmail(searchText);
  }

  Future<bool> createTeam() async {
    Team team = new Team(
        teamId: teamId,
        managerId: AuthService().currentUserId().toString(),
        members: members,
        teamName: teamName);
    try {
      String createdTeamId = await TeamService().createTeam(team);
      User user = await AuthService().currentUser();
      user.membership.add(createdTeamId);
      await UserService().updateUser(user);
      await TeamService().addMemberToTeam(createdTeamId, user);
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
    return TeamService().addMemberToTeam(teamId, user);
  }

  Future<bool> deleteMemberFromTeam(String teamId, String userId) async {
    return TeamService().deleteMemberFromTeam(teamId, userId);
  }
}
