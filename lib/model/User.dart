class User {
  String _userId;
  String _firstName;
  String _lastName;
  String _email;
  List<String> _membership;
  bool _isPremium;

  User(
      {String userId,
      String firstName,
      String lastName,
      String email,
      List<String> membership,
      bool isPremium}) {
    this._userId = userId;
    this._firstName = firstName;
    this._lastName = lastName;
    this._email = email;
    this._membership = membership;
    this._isPremium = isPremium;
  }

  String get userId => _userId;
  set userId(String userId) => _userId = userId;
  String get firstName => _firstName;
  set firstName(String firstName) => _firstName = firstName;
  String get lastName => _lastName;
  set lastName(String lastName) => _lastName = lastName;
  String get email => _email;
  set email(String email) => _email = email;
  List<String> get membership => _membership;
  set membership(List<String> membership) => _membership = membership;
  bool get isPremium => _isPremium;
  set isPremium(bool isPremium) => _isPremium = isPremium;

  User.fromJson(Map<String, dynamic> json) {
    _userId = json['userId'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _email = json['email'];
    _membership = json['membership'].cast<String>();
    _isPremium = json['isPremium'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this._userId;
    data['firstName'] = this._firstName;
    data['lastName'] = this._lastName;
    data['email'] = this._email;
    data['membership'] = this._membership;
    data['isPremium'] = this._isPremium;
    return data;
  }
}
