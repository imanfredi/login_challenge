import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthDataSource {
  Future<User?> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> signOut();

  User? getCurrentUser();

  Future<User?> signInWithGoogle();
}

class AuthDatasourceImpl implements AuthDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print("FirebaseAuthException: ${e.toString()}");
      rethrow;
    }
  }

  @override
  Future<User?> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredentials = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredentials.user;
    } on FirebaseAuthException catch (e) {
      print("FirebaseAuthException: ${e.toString()}");

      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      print("FirebaseAuthException: ${e.toString()}");
      rethrow;
    }
  }

  @override
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  @override
  Future<User?> signInWithGoogle() async {
    GoogleAuthProvider authProvider = GoogleAuthProvider();
    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithPopup(authProvider);
    return userCredential.user;
  }
}
