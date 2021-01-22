class Message {
  String _messageId;
  String _senderId;
  String _receiverId;
  String _content;
  String _createdAt;

  Message(
      {String messageId,
      String senderId,
      String receiverId,
      String content,
      String createdAt}) {
    this._messageId = messageId;
    this._senderId = senderId;
    this._receiverId = receiverId;
    this._content = content;
    this._createdAt = createdAt;
  }

  String get messageId => _messageId;
  set messageId(String messageId) => _messageId = messageId;
  String get senderId => _senderId;
  set senderId(String senderId) => _senderId = senderId;
  String get receiverId => _receiverId;
  set receiverId(String receiverId) => _receiverId = receiverId;
  String get content => _content;
  set content(String content) => _content = content;
  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;

  Message.fromJson(Map<String, dynamic> json) {
    _messageId = json['messageId'];
    _senderId = json['senderId'];
    _receiverId = json['receiverId'];
    _content = json['content'];
    _createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['messageId'] = this._messageId;
    data['senderId'] = this._senderId;
    data['receiverId'] = this._receiverId;
    data['content'] = this._content;
    data['createdAt'] = this._createdAt;
    return data;
  }
}
