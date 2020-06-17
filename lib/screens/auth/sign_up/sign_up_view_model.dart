import 'package:flutter/material.dart';
import 'package:ideashare/services/auth/auth_service.dart';

class SignUpViewModel with ChangeNotifier {
  SignUpViewModel({
    @required this.auth,
    this.firstName = "",
    this.lastName = "",
    this.email = "",
    this.password = "",
    this.isLoading = false,
  });

  final AuthService auth;

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
      await auth.createUserWithEmailAndPasswordAndDisplayName(email, password, firstName + " " + lastName);
      return true;
    } catch (e) {
      updateWith(isLoading: false);
      rethrow;
    }
  }
}
