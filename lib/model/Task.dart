import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Task {
  String _taskId;
  String _teamId;
  List<dynamic> _members;
  String _content;
  DateTime _dueDate;
  DateTime _createdAt;
  bool _isDone;

  Task({
    String taskId,
    String teamId,
    List<dynamic> members,
    String content,
    DateTime dueDate,
    DateTime createdAt,
    bool isDone,
  }) {
    this._taskId = taskId;
    this._teamId = teamId;
    this._members = members;
    this._content = content;
    this._dueDate = dueDate;
    this._createdAt = createdAt;
    this._isDone = isDone;
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
  bool get isDone => _isDone;
  set isDone(bool isDone) => _isDone = isDone;

  Task.fromJson(Map<String, dynamic> json) {
    _taskId = json['taskId'];
    _teamId = json['teamId'];
    _members = json['members'];
    _content = json['content'];
    _dueDate = json['dueDate'].toDate();
    _createdAt = json['createdAt'].toDate();
    _isDone = json['isDone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['taskId'] = this._taskId;
    data['teamId'] = this._teamId;
    data['members'] = this._members;
    data['content'] = this._content;
    data['dueDate'] = Timestamp.fromDate(this._dueDate);
    data['createdAt'] = Timestamp.fromDate(this._createdAt);
    data['isDone'] = this._isDone;
    return data;
  }
}
