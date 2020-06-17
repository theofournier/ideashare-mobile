import 'package:flutter/material.dart';
import 'package:ideashare/services/auth/auth_service.dart';

class SignInViewModel with ChangeNotifier {
  SignInViewModel({
    @required this.auth,
    this.email = "",
    this.password = "",
    this.isLoading = false,
  });

  final AuthService auth;

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
      updateWith(isLoading: false);
      return true;
    } catch (e) {
      updateWith(isLoading: false);
      rethrow;
    }
  }
}
