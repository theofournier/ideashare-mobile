import 'package:flutter/material.dart';
import 'package:ideashare/services/auth/auth_service.dart';
import 'package:ideashare/services/database/firestore_database.dart';
import 'package:ideashare/services/database/user_auth_firestore_database.dart';

class SignUpViewModel with ChangeNotifier {
  SignUpViewModel({
    @required this.auth,
    @required this.userFirestoreDatabase,
    this.firstName = "",
    this.lastName = "",
    this.email = "",
    this.password = "",
    this.isLoading = false,
  });

  final AuthService auth;
  final UserAuthFirestoreDatabase userFirestoreDatabase;

  String firstName;
  String lastName;
  String email;
  String password;
  bool isLoading;

  final formKey = GlobalKey<FormState>();

  void updateWith({
    String firstName,
    String lastName,
    String email,
    String password,
    bool isLoading,
    bool submitted,
  }) {
    this.firstName = firstName ?? this.firstName;
    this.lastName = lastName ?? this.lastName;
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.isLoading = isLoading ?? this.isLoading;
    notifyListeners();
  }

  void onSaveFirstName(String firstName) => this.updateWith(firstName: firstName.trim());

  void onSaveLastName(String lastName) => this.updateWith(lastName: lastName.trim());

  void onSaveEmail(String email) => this.updateWith(email: email.trim());

  void onSavePassword(String password) => this.updateWith(password: password);

  Future<bool> submit() async {
    if (!formKey.currentState.validate()) {
      return false;
    }
    formKey.currentState.save();
    updateWith(isLoading: true);
    try {
      UserAuth userAuth = await auth.createUserWithEmailAndPassword(email, password);
      userAuth = await auth.updateInfo(displayName: firstName + " " + lastName);
      await userFirestoreDatabase.createUser(userAuth.uid, firstName, lastName, userAuth.photoUrl, email);
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
