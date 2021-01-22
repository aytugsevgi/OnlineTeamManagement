class Task {
  String taskId;
  String teamId;
  List<String> members;
  String content;
  DateTime dueDate;
  DateTime createdAt;

  Task(
      {this.taskId,
      this.teamId,
      this.members,
      this.content,
      this.dueDate,
      this.createdAt});

  Task.fromJson(Map<String, dynamic> json) {
    taskId = json['taskId'];
    teamId = json['teamId'];
    members = json['members'].cast<String>();
    content = json['content'];
    dueDate = json['dueDate'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['taskId'] = this.taskId;
    data['teamId'] = this.teamId;
    data['members'] = this.members;
    data['content'] = this.content;
    data['dueDate'] = this.dueDate;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
