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

  Future<void> updateTeamName(String teamId, String givenName) {
    TeamService().updateTeamName(teamId, givenName);
  }

  Future<String> addMemberToTeam(String teamId, User user) async {
    TeamService().addMemberToTeam(teamId, user);
  }

  Future<String> deleteMemberFromTeam(String teamId, String userId) async {
    TeamService().deleteMemberFromTeam(teamId, userId);
  }
}
