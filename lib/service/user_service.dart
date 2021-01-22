import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_team_management/model/User.dart';

class UserService {
  Firestore _firestore = Firestore.instance;

  Future<bool> saveUser(User user) async {
    try {
      await _firestore.collection("Users").add(user.toJson());
      return true;
    } catch (e) {
      print("DEBUG couldn't save $e");
      return false;
    }
  }

  Future<bool> updateUser(User user) async {
    try {
      await _firestore.collection("Users").add(user.toJson());
      return true;
    } catch (e) {
      print("DEBUG couldn't save $e");
      return false;
    }
  }

  Future<User> getCurrentUser(String uid) async {
    try {
      DocumentSnapshot currentUser =
          await _firestore.collection("Users").document(uid).get();
      Map<String, dynamic> temp = currentUser.data;
      User user = User.fromJson(temp);
      return user;
    } catch (e) {
      return null;
    }
  }
}
