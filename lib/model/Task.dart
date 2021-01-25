import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  String _taskId;
  String _teamId;
  List<dynamic> _members;
  String _content;
  DateTime _dueDate;
  DateTime _createdAt;

  Task(
      {String taskId,
      String teamId,
      List<dynamic> members,
      String content,
      DateTime dueDate,
      DateTime createdAt}) {
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
  List<dynamic> get members => _members;
  set members(List<dynamic> members) => _members = members;
  String get content => _content;
  set content(String content) => _content = content;
  DateTime get dueDate => _dueDate;
  set dueDate(DateTime dueDate) => _dueDate = dueDate;
  DateTime get createdAt => _createdAt;
  set createdAt(DateTime createdAt) => _createdAt = createdAt;

  Task.fromJson(Map<String, dynamic> json) {
    print("x1");
    _taskId = json['taskId'];
    print("x2");
    _teamId = json['teamId'];
    print("x3");
    _members = json['members'];
    print("x4");
    _content = json['content'];
    print("x5");
    _dueDate = json['dueDate'].toDate();
    print("x6");
    _createdAt = json['createdAt'].toDate();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['taskId'] = this._taskId;
    data['teamId'] = this._teamId;
    data['members'] = this._members;
    data['content'] = this._content;
    data['dueDate'] = Timestamp.fromDate(this._dueDate);
    data['createdAt'] = Timestamp.fromDate(this._createdAt);
    return data;
  }
}
