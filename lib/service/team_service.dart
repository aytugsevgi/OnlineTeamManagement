import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_team_management/model/Team.dart';
import 'package:online_team_management/model/User.dart';

class TeamService {
  Firestore _firestore = Firestore.instance;

  Future<void> createTeam(Team team) async {
    try {
      await _firestore
          .collection("teams")
          .document(team.teamId)
          .setData(team.toJson());
    } catch (e) {
      print("DEBUG: team couldn't create $e");
    }
  }

  Future<bool> updateTeamName(String teamId, String givenName) async {
    try {
      await Firestore.instance
          .collection('teams')
          .document(teamId)
          .setData({'teamName': givenName});
      return true;
    } catch (e) {
      print("DEBUG: Error updateTeamName Service: $e");
      return false;
    }
  }

  Future<Team> searchTeam(String teamId) async {
    DocumentSnapshot _snapshot =
        await Firestore.instance.collection('teams').document(teamId).get();
    Team team = Team.fromJson(_snapshot.data);
    return team;
  }

  Future<bool> addMemberToTeam(String teamId, String userId) async {
    try {
      DocumentSnapshot foundTeam =
          await _firestore.collection("teams").document(teamId).get();

      Map<String, dynamic> temp = foundTeam.data;
      Team team = Team.fromJson(temp);
      team.members.add(userId);

      await Firestore.instance
          .collection('teams')
          .document(teamId)
          .setData({'members': team.members});
      return true;
    } catch (e) {
      print("DEBUG: Error addMemberToTeam Service: $e");
      return false;
    }
  }

  Future<bool> deleteMemberFromTeam(String teamId, String userId) async {
    try {
      DocumentSnapshot foundTeam =
          await _firestore.collection("teams").document(teamId).get();

      Map<String, dynamic> temp = foundTeam.data;
      Team team = Team.fromJson(temp);

      DocumentSnapshot foundUser =
          await _firestore.collection("users").document(userId).get();
      team.members.remove(foundUser);

      await Firestore.instance
          .collection('teams')
          .document(teamId)
          .setData({'members': team.members});
      return true;
    } catch (e) {
      print("DEBUG: Error deleteMemberFromTeam Service: $e");
      return false;
    }
  }
}
