class Task {
  String _taskId;
  String _teamId;
  List<String> _members;
  String _content;
  String _dueDate;
  String _createdAt;

  Task(
      {String taskId,
      String teamId,
      List<String> members,
      String content,
      String dueDate,
      String createdAt}) {
    this._taskId = taskId;
    this._teamId = teamId;
    this._members = members;
    this._content = content;
    this._dueDate = dueDate;
    this._createdAt = createdAt;
  }

  String get taskId => _taskId;
  set taskId(String taskId) => _taskId = taskId;
  String get teamId => _teamId;
  set teamId(String teamId) => _teamId = teamId;
  List<String> get members => _members;
  set members(List<String> members) => _members = members;
  String get content => _content;
  set content(String content) => _content = content;
  String get dueDate => _dueDate;
  set dueDate(String dueDate) => _dueDate = dueDate;
  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;

  Task.fromJson(Map<String, dynamic> json) {
    _taskId = json['taskId'];
    _teamId = json['teamId'];
    _members = json['members'].cast<String>();
    _content = json['content'];
    _dueDate = json['dueDate'];
    _createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['taskId'] = this._taskId;
    data['teamId'] = this._teamId;
    data['members'] = this._members;
    data['content'] = this._content;
    data['dueDate'] = this._dueDate;
    data['createdAt'] = this._createdAt;
    return data;
  }
}
