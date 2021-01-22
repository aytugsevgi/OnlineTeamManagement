class Comment {
  String ownerUserId;
  String taskId;
  String content;
  String createdAt;

  Comment({this.ownerUserId, this.taskId, this.content, this.createdAt});

  Comment.fromJson(Map<String, dynamic> json) {
    ownerUserId = json['ownerUserId'];
    taskId = json['taskId'];
    content = json['content'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ownerUserId'] = this.ownerUserId;
    data['taskId'] = this.taskId;
    data['content'] = this.content;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
