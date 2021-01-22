class Comment {
  String _ownerUserId;
  String _taskId;
  String _content;
  String _createdAt;

  Comment(
      {String ownerUserId, String taskId, String content, String createdAt}) {
    this._ownerUserId = ownerUserId;
    this._taskId = taskId;
    this._content = content;
    this._createdAt = createdAt;
  }

  String get ownerUserId => _ownerUserId;
  set ownerUserId(String ownerUserId) => _ownerUserId = ownerUserId;
  String get taskId => _taskId;
  set taskId(String taskId) => _taskId = taskId;
  String get content => _content;
  set content(String content) => _content = content;
  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;

  Comment.fromJson(Map<String, dynamic> json) {
    _ownerUserId = json['ownerUserId'];
    _taskId = json['taskId'];
    _content = json['content'];
    _createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ownerUserId'] = this._ownerUserId;
    data['taskId'] = this._taskId;
    data['content'] = this._content;
    data['createdAt'] = this._createdAt;
    return data;
  }
}
