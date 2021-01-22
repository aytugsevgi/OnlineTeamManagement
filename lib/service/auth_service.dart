import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  static final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<AuthResult> signUp(
      {@required String email, @required String password}) async {
    try {
      return await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      return null;
    }
  }

  Future<bool> login(
      {@required String email, @required String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  Future<String> currentUser() async {
    FirebaseUser currentUser = await firebaseAuth.currentUser();
    return currentUser.uid;
  }
}
