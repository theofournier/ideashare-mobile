import 'package:flutter/material.dart';
import 'package:ideashare/services/auth/auth_service.dart';

class ForgotPasswordViewModel with ChangeNotifier {
  ForgotPasswordViewModel({
    @required this.auth,
    this.email = "",
    this.isLoading = false,
  });

  final AuthService auth;

  String email;
  bool isLoading;

  final formKey = GlobalKey<FormState>();

  void updateWith({
    String email,
    bool isLoading,
    bool submitted,
  }) {
    this.email = email ?? this.email;
    this.isLoading = isLoading ?? this.isLoading;
    notifyListeners();
  }

  void onSaveEmail(String email) => this.updateWith(email: email);

  Future<bool> submit() async {
    if (!formKey.currentState.validate()) {
      return false;
    }
    formKey.currentState.save();
    updateWith(isLoading: true);
    try {
      await auth.sendPasswordResetEmail(email);
      updateWith(isLoading: false);
      return true;
    } catch (e) {
      updateWith(isLoading: false);
      rethrow;
    }
  }
}
