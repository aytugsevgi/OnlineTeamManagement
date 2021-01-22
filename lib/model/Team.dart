class Team {
  String teamId;
  String managerId;
  List<String> members;
  String teamName;

  Team({this.teamId, this.managerId, this.members, this.teamName});

  Team.fromJson(Map<String, dynamic> json) {
    teamId = json['teamId'];
    managerId = json['managerId'];
    members = json['members'].cast<String>();
    teamName = json['teamName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['teamId'] = this.teamId;
    data['managerId'] = this.managerId;
    data['members'] = this.members;
    data['teamName'] = this.teamName;
    return data;
  }
}
