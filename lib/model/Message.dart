class Message {
  String messageId;
  String senderId;
  String receiverId;
  String content;
  DateTime createdAt;

  Message(
      {this.messageId,
      this.senderId,
      this.receiverId,
      this.content,
      this.createdAt});

  Message.fromJson(Map<String, dynamic> json) {
    messageId = json['messageId'];
    senderId = json['senderId'];
    receiverId = json['receiverId'];
    content = json['content'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['messageId'] = this.messageId;
    data['senderId'] = this.senderId;
    data['receiverId'] = this.receiverId;
    data['content'] = this.content;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
