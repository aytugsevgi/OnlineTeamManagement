import 'package:online_team_management/model/Task.dart';
import 'package:online_team_management/model/User.dart';

class Team {
  String _teamId;
  String _managerId;
  List<User> _members;
  String _teamName;
  List<String> _tasks;

  Team(
      {String teamId,
      String managerId,
      List<User> members,
      String teamName,
      List<String> tasks}) {
    this._teamId = teamId;
    this._managerId = managerId;
    this._members = members;
    this._teamName = teamName;
    this._tasks = tasks;
  }

  String get teamId => _teamId;
  set teamId(String teamId) => _teamId = teamId;
  String get managerId => _managerId;
  set managerId(String managerId) => _managerId = managerId;
  List<User> get members => _members;
  set members(List<User> members) => _members = members;
  String get teamName => _teamName;
  set teamName(String teamName) => _teamName = teamName;
  List<String> get tasks => _tasks;
  set tasks(List<String> tasks) => _tasks = tasks;

  Team.fromJson(Map<String, dynamic> json) {
    _teamId = json['teamId'];
    _managerId = json['managerId'];
    _members = json['members'].cast<String>();
    _teamName = json['teamName'];
    _tasks = json['tasks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['teamId'] = this._teamId;
    data['managerId'] = this._managerId;
    data['members'] = this._members;
    data['teamName'] = this._teamName;
    data["tasks"] = this._tasks;
    return data;
  }
}
