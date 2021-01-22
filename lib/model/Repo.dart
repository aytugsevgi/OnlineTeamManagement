class Repo {
  TaskId taskId;

  Repo({this.taskId});

  Repo.fromJson(Map<String, dynamic> json) {
    taskId =
        json['taskId'] != null ? new TaskId.fromJson(json['taskId']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.taskId != null) {
      data['taskId'] = this.taskId.toJson();
    }
    return data;
  }
}

class TaskId {
  List<String> commentId;

  TaskId({this.commentId});

  TaskId.fromJson(Map<String, dynamic> json) {
    commentId = json['commentId'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['commentId'] = this.commentId;
    return data;
  }
}
