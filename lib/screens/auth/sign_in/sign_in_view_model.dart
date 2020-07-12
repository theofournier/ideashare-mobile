import 'package:flutter/material.dart';
import 'package:ideashare/services/auth/auth_service.dart';
import 'package:ideashare/services/database/user_auth_firestore_database.dart';

class SignInViewModel with ChangeNotifier {
  SignInViewModel({
    @required this.auth,
    @required this.userFirestoreDatabase,
    this.email = "",
    this.password = "",
    this.isLoading = false,
  });

  final AuthService auth;
  final UserAuthFirestoreDatabase userFirestoreDatabase;

  String email;
  String password;
  bool isLoading;

  final formKey = GlobalKey<FormState>();

  void updateWith({
    String email,
    String password,
    bool isLoading,
    bool submitted,
  }) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.isLoading = isLoading ?? this.isLoading;
    notifyListeners();
  }

  void onSaveEmail(String email) => this.updateWith(email: email.trim());

  void onSavePassword(String password) => this.updateWith(password: password);

  Future<bool> submit() async {
    if (!formKey.currentState.validate()) {
      return false;
    }
    formKey.currentState.save();
    updateWith(isLoading: true);
    try {
      await auth.signInWithEmailAndPassword(email, password);
      return true;
    } catch (e) {
      updateWith(isLoading: false);
      rethrow;
    }
  }

  Future<bool> signInWithGoogle() async {
    updateWith(isLoading: true);
    try {
      UserAuth userAuth = await auth.signInWithGoogle();
      List<String> names = userAuth.getNames();
      await userFirestoreDatabase.createUser(userAuth.uid, names[0], names[1], userAuth.photoUrl, userAuth.email);
      return true;
    } catch (e) {
      updateWith(isLoading: false);
      rethrow;
    }
  }

  Future<bool> signInWithFacebook() async {
    updateWith(isLoading: true);
    try {
      UserAuth userAuth = await auth.signInWithFacebook();
      List<String> names = userAuth.getNames();
      await userFirestoreDatabase.createUser(userAuth.uid, names[0], names[1], userAuth.photoUrl, userAuth.email);
      return true;
    } catch (e) {
      updateWith(isLoading: false);
      rethrow;
    }
  }
}
