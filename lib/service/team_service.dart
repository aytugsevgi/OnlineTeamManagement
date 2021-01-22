import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_team_management/model/Team.dart';
import 'package:online_team_management/model/User.dart';

class TeamService {
  Firestore _firestore = Firestore.instance;

  Future<String> createTeam(Team team) async {
    try {
      DocumentReference createdTeam =
          await _firestore.collection("teams").add(team.toJson());
      return createdTeam.documentID;
    } catch (e) {
      print("DEBUG: team couldn't create $e");
      return null;
    }
  }

  Future<void> updateTeamName(String teamId, String givenName) {
    Firestore.instance
        .collection('teams')
        .document(teamId)
        .setData({'teamName': givenName});
  }

  Future<String> addMemberToTeam(String teamId, User user) async {
    DocumentSnapshot foundTeam =
        await _firestore.collection("teams").document(teamId).get();

    Map<String, dynamic> temp = foundTeam.data;
    Team team = Team.fromJson(temp);
    team.members.add(user);

    Firestore.instance
        .collection('teams')
        .document(teamId)
        .setData({'members': team.members});
  }

  Future<String> deleteMemberFromTeam(String teamId, String userId) async {
    DocumentSnapshot foundTeam =
        await _firestore.collection("teams").document(teamId).get();

    Map<String, dynamic> temp = foundTeam.data;
    Team team = Team.fromJson(temp);

    DocumentSnapshot foundUser =
        await _firestore.collection("users").document(userId).get();
    team.members.remove(foundUser);

    Firestore.instance
        .collection('teams')
        .document(teamId)
        .setData({'members': team.members});
  }
}
