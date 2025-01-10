import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // Register a user with email and password
  Future<void> registerWithEmailPassword(String email, String password) async {
    try {
       await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

    } catch (e) {
      print("Error registering user: $e");
    }
  }

  // Login with email and password
  Future <void>loginWithEmailPassword(String email, String password) async {
    try {
        await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

    } catch (e) {
      print("Error logging in user: $e");
    }
  }


}
