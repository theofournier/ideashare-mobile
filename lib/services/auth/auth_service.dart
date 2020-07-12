import 'package:flutter/material.dart';

@immutable
class UserAuth {
  const UserAuth({
    this.uid,
    this.email,
    this.photoUrl,
    this.displayName,
  });

  final String uid;
  final String email;
  final String photoUrl;
  final String displayName;

  List<String> getNames() {
    String firstName = "";
    String lastName = "";
    if(displayName != null) {
      final names = displayName.split(" ");
      firstName = names[0];
      if(names.length >= 2){
        lastName = names.sublist(1).join(" ");
      }
    }
    return [firstName, lastName];
  }
}

abstract class AuthService {
  Future<UserAuth> currentUser();
  Future<UserAuth> signInWithEmailAndPassword(String email, String password);
  Future<UserAuth> createUserWithEmailAndPassword(String email, String password);
  Future<UserAuth> updateInfo({String displayName, String photoUrl});
  Future<void> sendPasswordResetEmail(String email);
  Future<UserAuth> signInWithGoogle();
  Future<UserAuth> signInWithFacebook();
  Future<void> signOut();
  Stream<UserAuth> get onAuthStateChanged;
}