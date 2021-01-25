import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_team_management/model/Task.dart';
import 'package:online_team_management/model/Team.dart';
import 'package:online_team_management/model/User.dart';

import 'package:online_team_management/service/auth_service.dart';
import 'package:online_team_management/service/team_service.dart';
import 'package:online_team_management/service/user_service.dart';
import 'package:uuid/uuid.dart';

class TeamController with ChangeNotifier {
  String teamId;
  String managerId;
  List<String> members;
  String teamName;
  String _searchText = "";
  User _user;
  String _createdTeamName = "";
  List<String> _createdTeamMembers = [];
  bool _isCreatedTeamLoading = false;

  get isCreatedTeamLoading => _isCreatedTeamLoading;

  set isCreatedTeamLoading(bool value) {
    _isCreatedTeamLoading = value;
    notifyListeners();
  }

  get createdTeamMembers => _createdTeamMembers;
  void addCreatedTeamMember(User value) {
    bool isAlreadyExist = false;

    for (String u in _createdTeamMembers) {
      if (u == value.userId) {
        isAlreadyExist = true;
        _user = null;
        break;
      }
    }

    if (!isAlreadyExist) {
      _createdTeamMembers.add(value.userId);
      _user = null;
    }
    notifyListeners();
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
      _user = User.fromJson(_documents[0].data);
      String currentUserId = await AuthService().currentUserId();
      print("DEBUG: CurrentUserId: $currentUserId");
      print("DEBUG: User Id: ${_user.userId}");
      if (currentUserId == _user.userId) {
        _user = null;
      }
    } else {
      _user = null;
    }
    notifyListeners();
  }

  Future<bool> createTeam() async {
    isCreatedTeamLoading = true;
    var uuid = Uuid();
    String id = uuid.v1();

    try {
      String userId = await AuthService().currentUserId();
      print(userId);
      Team team = new Team(
          teamId: id,
          managerId: userId,
          members: createdTeamMembers,
          tasks: [],
          teamName: createdTeamName);
      await TeamService().createTeam(team);
      User currentUser = await AuthService().currentUser();
      currentUser.membership.add(team.teamId);

      await UserService().updateUser(currentUser);
      for (String userId in team.members) {
        User member = await UserService().searchUser(userId);
        member.membership.add(team.teamId);
        await UserService().updateUser(member);
      }
      _createdTeamName = "";
      _createdTeamMembers = [];
      _user = null;
      _searchText = "";

      isCreatedTeamLoading = false;
      return true;
    } catch (e) {
      print("DEBUG: Error TeamController createTeam : $e ");
      isCreatedTeamLoading = false;
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

  Future<List<Team>> getTeams() async {
    return UserService().getTeams();
  }

  Future<List<Task>> getTeamsTasks(String teamId) async {
    return TeamService().getTeamTasks(teamId);
  }
}
