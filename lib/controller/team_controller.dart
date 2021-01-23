import 'package:online_team_management/model/Team.dart';
import 'package:online_team_management/model/User.dart';
import 'package:online_team_management/service/team_service.dart';

class TeamController {
  String teamId;
  String managerId;
  List<User> members;
  String teamName;

  Future<String> createTeam() async {
    Team team = new Team(
        teamId: teamId,
        managerId: managerId,
        members: members,
        teamName: teamName);
    return TeamService().createTeam(team);
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
